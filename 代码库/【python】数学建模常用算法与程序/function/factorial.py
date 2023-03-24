#!/usr/bin/env python3
# coding=utf-8

# 计算n的阶乘
def factorial(n):
    r = 1
    while n > 1:
        r *= n;n -= 1
    return r
