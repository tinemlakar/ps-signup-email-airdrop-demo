<script lang="ts" setup>
import SuperRareJpg from '~/assets/images/superrare.jpg';

const { isMd } = useScreen();

useHead({
  title: 'Ment NFT airdrop',
});
</script>

<template>
  <div class="my-10 flex flex-col gap-x-12 gap-y-8 md:flex-row lg:my-14">
    <div class="max-w-2xl md:pr-12">
      <span class="mb-2 inline-block text-xs font-bold uppercase tracking-[0.2em] text-info"
        >The Shape of MENT to Come</span
      >
      <h1>Sign up and win one of 200 MENT tokens</h1>

      <p class="body-lg mb-6">
        By signing up, you’ll be in the game for the hottest perks in the form of MENT token
      </p>
      <div class="max-w-sm">
        <FormSighUp btn-text="Sign up" />
      </div>
    </div>
    <div v-if="isMd" class="flex-cc relative w-full">
      <img :src="SuperRareJpg" class="mx-auto" width="461" height="461" alt="Super rare NFT" />
    </div>
  </div>
</template>
