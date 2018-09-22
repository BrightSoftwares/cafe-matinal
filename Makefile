#.PHONY *

keystore:
	@read -p "Enter key password: " keypwd; \
	@read -p "Enter store password: " storepwd; \
	@read -p "Enter alias name: " aliasname; \
	keytool -genkey -keystore cafematinal_keystore.jks -keyalg RSA -keysize 4096 -validity 10000 -alias $$aliasname -storepass $$storepwd -keypass $$keypwd -dname "CN=a" -noprompt

committravis:
	@read -p "Enter commit message: " cmsg; \
	git add .travis.yml && git commit -m "$$cmsg" && git push origin staged

cachegitpwd:
	git config --global credential.helper cache
	git config --global credential.helper 'cache --timeout=3600'

