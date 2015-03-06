# rac_factory

Note: Works in any version of Chrome, but needs Firefox 33. :)

1. Ruby193 is installed somewhere in C:\, e.g., C:\automation
    a. Set PATH to C:\automation\Ruby193\bin
2. Devkit for Ruby193 is installed in C:\automation\Ruby193\devkit\
    a. Add to PATH C:\automation\Ruby193\devkit
    b. Open cmd or git bash
    c. cd to C:\automation\Ruby193\devkit
    d. run the ff:
        ruby dk.rb init
        ruby dk.rb review
        ruby dk.rb install
3. Download ChromeDriver and IEDriver and unzip them to C:\automation\Ruby193\bin
4. Download selenium-server-standalone-2.44.0.jar and put it in C:\automation\Ruby193\bin
[I also have 2.44.2 and 2.43.1]
5. Install gems cucumber, watir and bundler
6. In Git Bash:
    a. cd to C:\automation
    b. git clone https://github.com/jcustodio99/rac_factory
    c. cd to rac_factory
    d. bundle install and install necessary gems (if needed)
    e. once bundle install is successful, run any of the ff:
        rake travel_insurance_quote BROWSER=chrome URL=https://rac.com.au
        rake travel_insurance_quote BROWSER=firefox URL=https://rac.com.au
        rake travel_insurance_quote BROWSER=ipad URL=https://rac.com.au
        rake travel_insurance_quote BROWSER=iphone URL=https://rac.com.au
