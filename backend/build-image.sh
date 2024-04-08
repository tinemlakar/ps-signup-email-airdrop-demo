set -e

docker build -t ps-signup-email-airdrop .
docker tag ps-signup-email-airdrop ps-signup-email-airdrop:latest
# docker save -o ps-signup-email-airdrop.tar ps-signup-email-airdrop:latest