set -e

docker build -t ps-signup-email-airdrop-app .
docker tag ps-signup-email-airdrop-app ps-signup-email-airdrop-app:latest
docker save -o ps-signup-email-airdrop-app.tar ps-signup-email-airdrop-app:latest