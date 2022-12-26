#define PY_SSIZE_T_CLEAN
#include <Python.h>
#include <sys/mman.h>

static PyObject *rmcof_execute_code(PyObject *self, PyObject *args) {
	char *mem;
	size_t sz;
	if (!PyArg_ParseTuple(args, "s#", &mem, &sz)) {
		return NULL;
	}
	void *code = mmap(NULL,
		sz,
		PROT_READ | PROT_WRITE | PROT_EXEC,
		MAP_ANONYMOUS | MAP_PRIVATE,
		0, 0);
	memcpy(code, mem, sz);
	uint64_t (*f)() = code;
	uint64_t result = f();
	munmap(code, sz);
	return Py_BuildValue("K", result);
}

static PyMethodDef RmcofMethods[] = {
	{ "execute_code", rmcof_execute_code, METH_VARARGS, "run machine code" },
	{ NULL, NULL, 0, NULL }
};

static struct PyModuleDef rmcofmodule = {
	PyModuleDef_HEAD_INIT,
	"rmcof",
	NULL,
	-1,
	RmcofMethods
};

PyMODINIT_FUNC PyInit_rmcof(void) {
	return PyModule_Create(&rmcofmodule);
}
