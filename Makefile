VERSION ?= 1.1.4

development:
	sudo apt-get update && \
	sudo apt-get install zsh && \
	sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

install:
	cd /tmp && \
	wget https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip && \
	unzip terraform_${VERSION}_linux_amd64.zip && \
	chmod +x ./terraform && sudo mv ./terraform /usr/local/bin/terraform
