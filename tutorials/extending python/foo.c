/*
 * gcc -shared -I/usr/include/python2.6 foo.c -o foo.so 
 */
#include <Python.h>
 
static PyObject *foo_add(PyObject *self, PyObject *args)
{
        int a;
            int b;
             
                if (!PyArg_ParseTuple(args, "ii", &a, &b))
                        {
                                    return NULL;
                                        }
                 
                    return Py_BuildValue("i", a + b);
}
 
static PyMethodDef foo_methods[] = {
            { "add", (PyCFunction)foo_add, METH_VARARGS, NULL },
                    { NULL, NULL, 0, NULL }
};
 
PyMODINIT_FUNC initfoo()
{
            Py_InitModule3("foo", foo_methods, "My first extension module.");
}
