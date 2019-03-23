#! /bin/bash
key_servers=('keyserver.ubuntu.com', 'hkp://pool.sks-keyservers.net')
read -p "Enter your real name: " name
read -p "Enter your email: " email
read -p "Enter your password: " password

message="Choose key server:"
index=0
for key_server in "${key_servers[@]}"
do
	message="$message
	$((index+1))) $key_server"
	((index++))
done

read -p "$message
Enter your key server number: " key_server

key_server="${key_servers[$key_server]}"

cat >conf <<EOF
%echo Generating a standard key
Key-Type: DSA
Key-Length: 1024
Subkey-Type: ELG-E
Subkey-Length: 1024
Name-Real: $name
Name-Email: $email
Passphrase: $password
%commit
%echo done
EOF

echo ">>>>>>> Generate key"
gpg --batch --gen-key ./conf

key_id="$(gpg --list-secret-keys --with-colons | grep '^fpr:' | head -n1 | awk -F\: '{print $10}')"

echo ">>>>>>> Send key to $key_server"
gpg --keyserver "$key_server" --send-keys "$key_id"

private_key="$(gpg --export-secret-keys "$key_id" | base64 | tr -d '\n')"

echo "

>>>>>>> RESULT <<<<<<<"
echo name=$name
echo email=$email
echo password=$password
echo key_server=$key_server
echo key_id=$key_id
echo private_key=$private_key

echo "
>>>>>>> FOR sonatype <<<<<<<"
echo SIGNING_KEYID=${key_id: -8}
echo SIGNING_PASSWORD=$password
echo GPG_KEY=$private_key

