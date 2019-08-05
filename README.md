# Logrus adapter

[![Build Status](https://travis-ci.org/jkaveri/goabs-adapter-logrus.svg?branch=master)](https://travis-ci.org/jkaveri/goabs-adapter-logrus)
[![codecov](https://codecov.io/gh/jkaveri/goabs-adapter-logrus/branch/master/graph/badge.svg)](https://codecov.io/gh/jkaveri/goabs-adapter-logrus)


An adapter help you connect logrus with [goabs-log](github.com/jkaveri/goabs-log)

## Usages

### Install

```bash
# install logging abstraction package then you can use
# this pacakge for your logging
go get -u github.com/jkaveri/goabs-log

## install logrus adapter to use logrus as log engine
go get -u github.com/jkaveri/goabs-adapter-logrus
```

### Code

Do logging without concern
```go
func DoStuff() {
    // write log every where you want
    // using the github.com/jkaveri/goabs-log package.
    log.Info("info log text")
}
```

Configure logging abstraction to use logrus
```go
package main
import (
	log "github.com/jkaveri/goabs-log"
    adapter "github.com/jkaveri/goabs-log/adapter-logrus"
    "github.com/sirupsen/logrus"
)
func main() {
    // create logrus logger instance
    logger := logrus.New()
    // create adapter
    logrusAdapter := adapter.NewAdapterLogrus(logger)
    // configure logging 
    log.Configure(logrusAdapter)
}
```