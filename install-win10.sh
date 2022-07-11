#!/data/data/com.termux/files/usr/bin/bash
# KhanhNguyen9872
# Update package
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
light_cyan='\033[1;96m'
reset='\033[0m'
pkg update -y && pkg upgrade -y && pkg install wget tar qemu-system-aarch64-headless -y
# Download base and sha512sum
clear
cd 2> /dev/null
printf "\n\n${light_cyan} - Dang tai ve....(2.54GB)${green}\n\n"
wget -O base_arm64-khanhnguyen.tar.xz "https://public.dm.files.1drv.com/y4mnYTlsr_xnaiTuYLB94W9aQtQJ0AB4ovc99BHv1ARMGYh6U6OD_PHC-2rI-n6HzOT06EaQZHVvTUwIufo-BOeyV7oZ-C4b8NCoBLYc2nQ1qFFs7VK1p55HUtki0tu98031pCMWXF4H5RajJrY36uBSfU-5TSbWJa4XS4XhUg9Vcj4K7y7BN2AyBhald9vpPcCCSrFQVgoYLA12tTAlmxB6u7UuGvd4O-BVeUVH9hcv4Q?access_token=EwAQA61DBAAU2kADSankulnKv2PwDjfenppNXFIAAUd4QLpA401O2no1FSN159yVmV4ZUiUQiyIBeLsPR9FUPApruOLiWpadKEjPyZEQuENOucLtAiv9mFb7wpOD1h4AsGpWc2bd2c0S/9GQnCQi7OFy3cH/laZKzYdJRDvYO%2btZeWSCF/yMmfMdQsRzq%2b87XKTstmakjLIa3%2bdNcJbWoIgBNx%2bgsbnS7wCHQgDdHIlw3yfj6BX9LXQ75NtXMc8jaPoSsqKqwRRJi23JBe4YauhHdjg/P6SsyrDjQ1gDvPhwBwSLjd0FkXQRtboWOBEAvhTZi2ZyvbzlHtJf7cERsv9bd0yIZin5LLCQ1uqprpm7s8B7xgOLYC08EyC%2bgmkDZgAACGmEFSDZiFTg4AHcklB7Wd5kijDHtiCFT0zPXXdFWeufCzCQPcBcfdbsQRkVmcMh2i7zx4yKY4YwtDWZyPvLB7IGYF2lZ9wOaKpHQyzAeNEmuYmZrqLbIl4imtEpdpJ45JmuztYccbnqv0nfpOXj4Nt1rQvBx9dPJ1Z2DKdclN3zpBisKzFVXTcnEkUv5d6SmqiDVtFIhJ43gKecczJ6%2bA6wdYqzjaRK1HCxOyFYloY7lhOkoPu2B84%2boqWb8tW0OAIiI80OkoqSPsar6G7uiNj/gsz4mc47WfywU/KAqQ1v2XYiA3N/fo1kJRENIqHCjY7cA%2bGfukKtR159URDtDgC7M71zCvGaeWIIGFZTWk/IMmVSqzA9FU/QoIsRNtiea/ohCIL%2bcctLcMP620pDYQglnN1P33X%2b5GcPho/XIBo68YebCQijQK%2brcqsM7LKsMIJH/x5%2bsy9SGU8W7soO2k9lYxLpBl9ss8eE21QMPoxt1IwFgf7aeD1oLMJ8qZ3rGwN8XzYa0HEUc1kVV6U56rnUXPZ9ijSGqxBy/6%2ba4NqLJBoMJAtdyPMyWiz/YHS56Hd7w%2bU2YBGKZ%2bT461lETp/6CwzgvWzw85Ywie5zY8h3RNWvF7kCJL2ITg9RJMrtenZouLUdHHg5UW0bAg%3d%3d"
wget -O base_arm64-khanhnguyen.sha512sum "https://github.com/KhanhNguyen9872/Windows10ARM64/releases/download/Win10ARM64Base/base_arm64-khanhnguyen.sha512sum" 2> /dev/null
# Verify base file
clear
printf "\n\n${light_cyan} - Dang kiem tra file cai dat.....${green}\n\n"
sha512sum -c base_arm64-khanhnguyen.sha512sum || {
            printf "${red} File cai dat bi hong. Vui long cai lai \n\n${reset}"
			rm -f base_arm64-khanhnguyen.tar.xz 2> /dev/null
			rm -f win10 2> /dev/null
			rm -f base_arm64-khanhnguyen.sha512sum 2> /dev/null
            exit 1
}
# Install
printf "\n\n${light_cyan} - Dang cai dat! Vui long cho.....${green}\n\n"
rm -f base_arm64-khanhnguyen.sha512sum 2> /dev/null
if [ -f base_arm64-khanhnguyen.tar.xz ] 2> /dev/null; then
	tar -xJf base_arm64-khanhnguyen.tar.xz 2> /dev/null || :
	rm -f base_arm64-khanhnguyen.tar.xz 2> /dev/null
else
	printf "${red} - Cai dat that bai! Vui long thu lai sau! ${reset}\n"
	exit 1
fi
cd 2> /dev/null
wget -O win10 "https://raw.githubusercontent.com/KhanhNguyen9872/Windows10ARM64/main/win10" 2> /dev/null
# Configuring base
printf "\n\n${light_cyan} - Configuring base.....${green}\n\n"
mv win10 ${PREFIX}/bin/win10 2> /dev/null
chmod 777 ${PREFIX}/bin/win10 2> /dev/null
chmod 777 base_arm64 2> /dev/null
if [ -f base_arm64/khanh/base_arm64.qcow2 ] 2> /dev/null; then
	if [ -f base_arm64/khanh/BIOS.img ] 2> /dev/null; then
		if [ -f base_arm64/khanh/qemu.conf ] 2> /dev/null; then
			success=1 2> /dev/null
		else
			success=0 2> /dev/null
		fi
	else
	success=0 2> /dev/null
	fi
else
success=0 2> /dev/null
fi
clear
if [[ $success -eq 1 ]] 2> /dev/null; then
	printf "\n ${yellow} - INSTALL COMPLETED!\n"
	printf "${light_cyan} You can run 'win10' to start Windows10ARM64\n"
	printf "\n${yellow} - Use 'VNC Viewer' to connect 127.0.0.1:1\n${reset}"
	exit 0
else
	printf "\n ${red} - INSTALL FAILED!\n"
	printf "${light_cyan} Please try again!\n"
	rm -f ${PREFIX}/bin/win10 2> /dev/null
	rm -rf base_arm64 2> /dev/null
	exit 1
fi

