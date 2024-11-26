# Install java ecommerce

## Requirements

* VPS - access✅
    * public id ``3.71.36.27``✅
    * user name ``ec2-user`` ✅
    * private key
        * ``curl -O http://adsk.dydaktyka.jkan.pl/_static/id_student``
        * ``chmod 600 id_student``
    * ``ssh username@ip -i private_key``
    ``ssh ec2-user@3.71.36.27 -i id_student``
    * passphrase ``student1``
* ecommerce - repo
    * github ``https://github.com/jkanclerz/computer-programming-4-2024`` ✅

## ToDoes
* Upgrade system dependency
    * ``sudo dnf update && sudo dnf upgrade``
    * ``sudo dnf upgrade``
* Install git
    * search for packages
        * ``dnf search {query}``
        * ``dnf search git``
    * install packages
        * ``sudo dnf install git``
* Sync repo
    ``git clone {repo}``
* install jave env
    * instal java JRE ``java-17-amazon-corretto``
    * ``sudo dnf install java-17-amazon-corretto``
    * install Maven
        * download mvn binary ``wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz``
    * unarchive ``tar zxvf apache-maven-3.9.9-bin.tar.gz``
    * link to PATH aware dir ``sudo ln -s /home/ec2-user/apache-maven-3.9.9/bin/mvn /usr/bin/mvn``

* Compile & test & start
    * ``mvn compile``
    * ``mvn test``
    * ``mvn package``
* start it
``java -Dserver.port=8080 -jar target/CreditCard-1.0-SNAPSHOT.jar``

## Finall output

* open ``http://{public ip}:80``
* assert myEcommerceIsAvailable() 