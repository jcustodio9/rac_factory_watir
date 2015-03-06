# rac_factory

Note: Works in any version of Chrome, but needs Firefox 33. :)

1. Ruby193 is installed somewhere in C:\, e.g., C:\automation <br\>
    a. Set PATH to C:\automation\Ruby193\bin <br\>
2. Devkit for Ruby193 is installed in C:\automation\Ruby193\devkit\ <br\>
    a. Add to PATH C:\automation\Ruby193\devkit <br\>
    b. Open cmd or git bash <br\>
    c. cd to C:\automation\Ruby193\devkit <br\>
    d. run the ff: <br\>
        ruby dk.rb init <br\>
        ruby dk.rb review <br\>
        ruby dk.rb install <br\>
3. Download ChromeDriver and IEDriver and unzip them to C:\automation\Ruby193\bin <br\>
4. Download selenium-server-standalone-2.44.0.jar and put it in C:\automation\Ruby193\bin <br\>
[I also have 2.44.2 and 2.43.1] <br\>
5. Install gems cucumber, watir and bundler <br\>
6. In Git Bash: <br\>
    a. cd to C:\automation <br\>
    b. git clone https://github.com/jcustodio99/rac_factory <br\>
    c. cd to rac_factory <br\>
    d. bundle install and install necessary gems (if needed) <br\>
    e. once bundle install is successful, run any of the ff: <br\>
        rake travel_insurance_quote BROWSER=chrome URL=https://rac.com.au <br\>
        rake travel_insurance_quote BROWSER=firefox URL=https://rac.com.au <br\>
        rake travel_insurance_quote BROWSER=ipad URL=https://rac.com.au <br\>
        rake travel_insurance_quote BROWSER=iphone URL=https://rac.com.au <br\>
