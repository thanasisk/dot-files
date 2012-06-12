from distutils.core import setup, Extension
 
foomodule = Extension('foo', sources = ['foo.c'])
  
setup (name = 'Foo',
            version = '1.0',
            description = 'This is a package for Foo',
            ext_modules = [foomodule])
