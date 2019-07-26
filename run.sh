#!/bin/bash


# runsvdir /etc/service

cat /etc/privoxy/config
ls -la /etc/privoxy/
privoxy --no-daemon  /etc/privoxy/config 