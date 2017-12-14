# Swagger Codegen

- Generates Code for **many** languages according to your `Swagger Specification` you wrote in JSON or YAML.
- For Documentation Generation, install `swagger-ui` globally through NodeJS: `$ npm i -g swagger-ui`.
- **Further Help**
- For information on Swagger, visit [Swagger.io](https://swagger.io)
- For Help with the CodeGen: [Swagger Codegen Docs](https://swagger.io/docs/swagger-tools/#installation-11)

---

## Required
- Linux OS (Using Ubuntu)
- Java Installed (JRE)
  - Must be 7 or higher

## Setup
- Copy to any place you want, I prefer `~/apps/swagger-cli`
- Run the init file: `sudo ./init.sh setup`
- This downloads the swagger-codegen-cli, creates a symlink, and a shorthand global call to `$ swagger-codegen`.

## Running

After setup all you have to do is type `$ swagger-codegen` followed by the swagger specification (json/yml) you want to build, example:

```
swagger-codegen generate -i http://petstore.swagger.io/v2/swagger.json -l javascript
swagger-codegen generate -i http://petstore.swagger.io/v2/swagger.yml -l javascript
```

The Generated code will include a `README` with all information needed to run/build your API. 
It is different for each language.

## Manual Running
This would be a
```
java -jar /path/to/the/jar/swagger-codegen-cli-2.2.1.jar help
```

## Updating

I made this fairly easy, simply edit the `init.sh` file, changes the `PACKAGE` variable to the latest version,
and run `./init -u` or `./init -update`. You only need tp provide the filename, not the entire path.


## Removing
- Simply run: `sudo rm /usr/local/bin/swagger-codegen`
- Then remove this folder.

---

- Unlicense
- Swagger code is Copyright to whatever they have lol.

(c) 2017 Jesse Boyer <[JREAM](https://jream.com)>
