grpcio warnings empty http_proxy issue
======================================

Abstract
--------

This is a demonstration that grpcio outputs following messages when running with empty `http_proxy`:

```
E1230 02:42:28.834924400       1 uri_parser.cc:46]           bad uri.scheme: ''
E1230 02:42:28.835090500       1 uri_parser.cc:52]                            ^ here
E1230 02:42:28.835106400       1 http_proxy.cc:63]           cannot parse value of 'http_proxy' env var
```

Situation
---------

* I need a http proxy for my local computers.
* The CI environment is directly connected to the Internet (actually, it's located on Google Compute Engine), and I don't need http proxies.
* I want to run tests with `docker-compose up test` both on local computers and the CI environment.

How to use
----------

```
docker-compose run --rm --use-aliases python
```

See also
--------

* https://github.com/grpc/grpc/issues/17631
