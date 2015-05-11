#!/bin/bash

mvn clean install
cd webapi
mvn jetty:run