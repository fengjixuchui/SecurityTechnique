#encoding:utf-8
import re
import os

def Check(filestr,filepath):

    #php zendһ�仰  caidao.php
    if filestr[:4]=='Zend':
        if os.path.getsize(filepath)==178:
            return (('Zend Encode',),),'zend'

        #���������ж�c
        return None
