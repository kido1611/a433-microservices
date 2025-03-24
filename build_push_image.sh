#/bin/sh

# Untuk menampilkan tulisan title
print_title() {
  # print kata/kalimat dengan text bold, background merah, berwarna putih
  # 1  : Bold
  # 41 : Background Red
  # 37 : Text White
  # 0  : Reset
  echo -e "\e[1;41;37m $1 \e[0m"
}

# build container image
print_title "Build container image"
docker build -t ghcr.io/kido1611/shipping-service:latest .

echo ""

# login container registry ghcr.io
print_title "Login to Container Registry"
echo $PASSWORD_GITHUB_PACKAGES | docker login -u kido1611 --password-stdin ghcr.io

echo ""

# push container image to container registry (Github Packages)
print_title "Push container image"
docker push ghcr.io/kido1611/shipping-service:latest
