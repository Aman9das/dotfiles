#!/bin/bash

# Define the main function which will contain your code
main() {
	if command -v cht.sh &>/dev/null; then
		exit 0
	else
		curl -s https://cht.sh/:cht.sh | sudo tee /usr/bin/cht.sh && sudo chmod +x /usr/bin/cht.sh
	fi
}

# Call the main function
main

# Add additional functions and calls as necessary

# EOF
exit 0
