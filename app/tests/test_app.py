# -*- coding: utf-8 -*-

import app
from nose.tools import *


class TestAdd:

    def test_add_nums(self):
        actual = app.add(1, 10)
        assert actual == 11

    @raises(RuntimeError)
    def test_add_not_num1(self):
        actual = app.add(None, 10)

    @raises(RuntimeError)
    def test_add_not_num2(self):
        actual = app.add(1, None)
