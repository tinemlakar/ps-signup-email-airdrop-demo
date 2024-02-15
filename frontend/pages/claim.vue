<script lang="ts" setup>
type Address = `0x${string}`;
import SuccessSVG from '~/assets/images/success.svg';
import { useAccount, useConnect, useContractRead, useWalletClient } from 'use-wagmi';
import { abi } from '~/lib/config/abi';
import { getContractAddress } from 'viem';

definePageMeta({
  layout: 'claim',
});
useHead({
  title: 'Apillon email airdrop prebuilt solution',
});

const { query } = useRoute();
const router = useRouter();
const message = useMessage();
const txWait = useTxWait();
const { handleError } = useErrors();

const { address, isConnected } = useAccount();
const { data: walletClient, refetch } = useWalletClient();
const { connect, connectors } = useConnect();
const { initContract, getTokenUri } = useContract();

const loading = ref<boolean>(false);

onBeforeMount(() => {
  if (!query.token) {
    router.push('/');
  }
});

async function claimAirdrop() {
  loading.value = true;
  try {
    await refetch();
    const timestamp = new Date().getTime();

    if (!walletClient.value) {
      await connect({ connector: connectors.value[0] });

      if (!walletClient.value) {
        message.error('Could not connect with wallet');
        loading.value = false;
        return;
      }
    }

    const signature = await walletClient.value.signMessage({ message: `test\n${timestamp}` });
    const res = await $api.post<ClaimResponse>('/users/claim', {
      jwt: query.token?.toString() || '',
      signature,
      address: address.value,
      timestamp,
    });
    if (res.data && res.data.success) {
      txWait.hash.value = res.data.transactionHash as Address;

      console.debug('Transaction', txWait.hash.value);
      message.info('Minting of your NFT has begun.');

      const receipt = await txWait.wait();
      console.debug(receipt);
      message.success('You successfully claimed NFT');

      if (receipt.data?.to && receipt.data?.logs[0].topics[3]) {
        const nftId = Number(receipt.data?.logs[0].topics[3]);

        await loadNft(receipt.data.to, nftId, res.data.transactionHash);
      } else {
        message.error('Mint failed, missing NFT ID!');
      }
    }
  } catch (e) {
    handleError(e);
  }
  loading.value = false;
}

async function loadNft(contract: Address, id: number, transactionHash: string) {
  try {
    await initContract(contract);
    const url = await getTokenUri(id);

    const metadata = await fetch(url).then(response => {
      return response.json();
    });
    router.push({ name: 'share', query: { ...metadata, txHash: transactionHash } });
  } catch (e) {
    console.error(e);
    message.error('Fetch failed, missing NFT metadata!');
  }
}
</script>

<template>
  <div class="max-w-md w-full md:px-6 my-12 mx-auto">
    <img :src="SuccessSVG" class="mx-auto" width="165" height="169" alt="airdrop" />

    <div v-if="!isConnected" class="my-8 text-center">
      <h3 class="mb-6">Almost there!</h3>
      <p>
        But first, connect compatible digital wallet. This step is crucial for securely receiving
        and managing the MENT token you’ll about to receive.
      </p>
    </div>

    <div v-else class="my-8 text-center">
      <h3 class="mb-6">Great success!</h3>
      <p>
        You’ve connected your wallet and you are one click away from your bonus-filled MENT token.
        See what the future of MENT holds for you 🔮
      </p>
    </div>

    <ConnectWallet v-if="!isConnected" size="large" />
    <Btn v-else size="large" :loading="loading" @click="claimAirdrop()">Claim your MENT token</Btn>
  </div>
</template>
