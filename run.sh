#!/bin/bash

cat /etc/privoxy/config
privoxy --no-daemon  /etc/privoxy/config 