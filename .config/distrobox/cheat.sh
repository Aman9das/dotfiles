#!/bin/bash

# Define the main function which will contain your code
main() {
	curl -s https://cht.sh/:cht.sh | sudo tee /usr/bin/cht.sh && sudo chmod +x /usr/bin/cht.sh
}

# Call the main function
main

# Add additional functions and calls as necessary

# EOF
exit 0
