# Cloud One Application Security with Tomcat

- [Cloud One Application Security with Tomcat](#cloud-one-application-security-with-tomcat)
  - [Build](#build)
  - [Run](#run)
  - [Access](#access)
  - [Test](#test)
  - [Support](#support)
  - [Contribute](#contribute)

## Build

```sh
docker build -t c1-tomcat .
```

## Run

```sh
docker run -p 8080:8080 c1-tomcat
```

## Access

```sh
http://192.168.0.27:8080/UploadServlet30/upload.jsp
```

## Test

```sh
curl -H "User-Agent: () { :; }; /bin/eject" http://127.0.0.1:8080
```

## Support

This is an Open Source community project. Project contributors may be able to help, depending on their time and availability. Please be specific about what you're trying to do, your system, and steps to reproduce the problem.

For bug reports or feature requests, please [open an issue](../../issues). You are welcome to [contribute](#contribute).

Official support from Trend Micro is not available. Individual contributors may be Trend Micro employees, but are not official support.

## Contribute

I do accept contributions from the community. To submit changes:

1. Fork this repository.
1. Create a new feature branch.
1. Make your changes.
1. Submit a pull request with an explanation of your changes or additions.

I will review and work with you to release the code.
