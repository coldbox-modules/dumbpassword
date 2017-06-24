[![Build Status](https://travis-ci.org/coldbox-modules/cbox-dumbpassword.svg?branch=development)](https://travis-ci.org/coldbox-modules/cbox-dumbpassword)

# Welcome to the Dumb Password Module

This module is based on a fork of https://github.com/unicodeveloper/laravel-password but made for ColdBox applications and the ColdBox Validation module.  This package can be used to verify the user provided password is not one of the top 10,000 worst passwords as analyzed by a respectable IT security analyst. Read about all [here](https://xato.net/10-000-top-passwords-6d6380716fe0#.473dkcjfm), [here(wired)](http://www.wired.com/2013/12/web-semantics-the-ten-thousand-worst-passwords/) or [here(telegram)](http://www.telegraph.co.uk/technology/internet-security/10303159/Most-common-and-hackable-passwords-on-the-internet.html)

### LICENSE
Apache License, Version 2.0.

### IMPORTANT LINKS
- https://github.com/coldbox-modules/cbox-dumbpassword

### SYSTEM REQUIREMENTS
- Lucee 4.5+
- Adobe ColdFusion 10+
- ColdBox 4+

## Installation

Just drop into your modules folder or use [CommandBox](http://www.ortussolutions.com/products/commandbox) to install

`box install dumbpassword`

## Usage

The module will register a service called `PasswordService@dumbpassword` which you can use to validate against the dumb password database.  Just use the method `isDumb( target )` and pass in your password to validate it.

```js
/**
* Verify if the passed password target is dumb or not.
*/
boolean function isDumb( required target ){
}
```

### Validation

You can also use the included ColdBox validation custom validator as it is mapped as `Validator@dumbpassword`.  YOu can then just define it in your `validator` key in the desired password field.

```js
{ password : { validator: "Validator@dumbpassword" } }
```


********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.ortussolutions.com
********************************************************************************
####HONOR GOES TO GOD ABOVE ALL
Because of His grace, this project exists. If you don't like this, then don't read it, its not for you.

>"Therefore being justified by faith, we have peace with God through our Lord Jesus Christ:
By whom also we have access by faith into this grace wherein we stand, and rejoice in hope of the glory of God.
And not only so, but we glory in tribulations also: knowing that tribulation worketh patience;
And patience, experience; and experience, hope:
And hope maketh not ashamed; because the love of God is shed abroad in our hearts by the 
Holy Ghost which is given unto us. ." Romans 5:5

###THE DAILY BREAD
 > "I am the way, and the truth, and the life; no one comes to the Father, but by me (JESUS)" Jn 14:1-12