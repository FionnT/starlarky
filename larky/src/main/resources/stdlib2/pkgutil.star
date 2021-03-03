def _get_spec(finder, name):
    """
    Return the finder-specific module spec.
    """
def read_code(stream):
    """
     This helper is needed in order for the PEP 302 emulation to
     correctly handle compiled files

    """
def walk_packages(path=None, prefix='', onerror=None):
    """
    Yields ModuleInfo for all modules recursively
        on path, or, if path is None, all accessible modules.

        'path' should be either None or a list of paths to look for
        modules in.

        'prefix' is a string to output on the front of every module name
        on output.

        Note that this function must import all *packages* (NOT all
        modules!) on the given path, in order to access the __path__
        attribute to find submodules.

        'onerror' is a function which gets called with one argument (the
        name of the package which was being imported) if any exception
        occurs while trying to import a package.  If no onerror function is
        supplied, ImportErrors are caught and ignored, while all other
        exceptions are propagated, terminating the search.

        Examples:

        # list all modules python can access
        walk_packages()

        # list all submodules of ctypes
        walk_packages(ctypes.__path__, ctypes.__name__+'.')
    
    """
    def seen(p, m={}):
        """
        '__path__'
        """
def iter_modules(path=None, prefix=''):
    """
    Yields ModuleInfo for all submodules on path,
        or, if path is None, all top-level modules on sys.path.

        'path' should be either None or a list of paths to look for
        modules in.

        'prefix' is a string to output on the front of every module name
        on output.
    
    """
def iter_importer_modules(importer, prefix=''):
    """
    'iter_modules'
    """
def _iter_file_finder_modules(importer, prefix=''):
    """
     ignore unreadable directories like import does

    """
def _import_imp():
    """
    'ignore'
    """
def ImpImporter:
    """
    PEP 302 Finder that wraps Python's "classic" import algorithm

        ImpImporter(dirname) produces a PEP 302 finder that searches that
        directory.  ImpImporter(None) produces a PEP 302 finder that searches
        the current sys.path, plus any modules that are frozen or built-in.

        Note that ImpImporter does not currently support being used by placement
        on sys.meta_path.
    
    """
    def __init__(self, path=None):
        """
        This emulation is deprecated, use 'importlib' instead
        """
    def find_module(self, fullname, path=None):
        """
         Note: we ignore 'path' argument since it is only used via meta_path

        """
    def iter_modules(self, prefix=''):
        """
         ignore unreadable directories like import does

        """
def ImpLoader:
    """
    PEP 302 Loader that wraps Python's "classic" import algorithm
    
    """
    def __init__(self, fullname, file, filename, etc):
        """
        This emulation is deprecated, use 'importlib' instead
        """
    def load_module(self, fullname):
        """
         Note: we don't set __loader__ because we want the module to look
         normal; i.e. this is just a wrapper for standard import machinery

        """
    def get_data(self, pathname):
        """
        rb
        """
    def _reopen(self):
        """
        'r'
        """
    def _fix_name(self, fullname):
        """
        Loader for module %s cannot handle 
        module %s
        """
    def is_package(self, fullname):
        """
        'exec'
        """
    def get_source(self, fullname=None):
        """
        'r'
        """
    def _get_delegate(self):
        """
        '__init__'
        """
    def get_filename(self, fullname=None):
        """
        ''
        """
def get_importer(path_item):
    """
    Retrieve a finder for the given path item

        The returned finder is cached in sys.path_importer_cache
        if it was newly created by a path hook.

        The cache (or part of it) can be cleared manually if a
        rescan of sys.path_hooks is necessary.
    
    """
def iter_importers(fullname=""):
    """
    Yield finders for the given module name

        If fullname contains a '.', the finders will be for the package
        containing fullname, otherwise they will be all registered top level
        finders (i.e. those on both sys.meta_path and sys.path_hooks).

        If the named module is in a package, that package is imported as a side
        effect of invoking this function.

        If no module name is specified, all top level finders are produced.
    
    """
def get_loader(module_or_name):
    """
    Get a "loader" object for module_or_name

        Returns None if the module cannot be found or imported.
        If the named module is not already imported, its containing package
        (if any) is imported, in order to establish the package __path__.
    
    """
def find_loader(fullname):
    """
    Find a "loader" object for fullname

        This is a backwards compatibility wrapper around
        importlib.util.find_spec that converts most failures to ImportError
        and only returns the loader rather than the full spec
    
    """
def extend_path(path, name):
    """
    Extend a package's path.

        Intended use is to place the following code in a package's __init__.py:

            from pkgutil import extend_path
            __path__ = extend_path(__path__, __name__)

        This will add to the package's __path__ all subdirectories of
        directories on sys.path named after the package.  This is useful
        if one wants to distribute different parts of a single logical
        package as multiple directories.

        It also looks for *.pkg files beginning where * matches the name
        argument.  This feature is similar to *.pth files (see site.py),
        except that it doesn't special-case lines starting with 'import'.
        A *.pkg file is trusted at face value: apart from checking for
        duplicates, all entries found in a *.pkg file are added to the
        path, regardless of whether they are exist the filesystem.  (This
        is a feature.)

        If the input path is not a list (as is the case for frozen
        packages) it is returned unchanged.  The input path is not
        modified; an extended copy is returned.  Items are only appended
        to the copy at the end.

        It is assumed that sys.path is a sequence.  Items of sys.path that
        are not (unicode or 8-bit) strings referring to existing
        directories are ignored.  Unicode items of sys.path that cause
        errors when used as filenames may cause this function to raise an
        exception (in line with os.path.isdir() behavior).
    
    """
def get_data(package, resource):
    """
    Get a resource from a package.

        This is a wrapper round the PEP 302 loader get_data API. The package
        argument should be the name of a package, in standard module format
        (foo.bar). The resource argument should be in the form of a relative
        filename, using '/' as the path separator. The parent directory name '..'
        is not allowed, and nor is a rooted name (starting with a '/').

        The function returns a binary string, which is the contents of the
        specified resource.

        For packages located in the filesystem, which have already been imported,
        this is the rough equivalent of

            d = os.path.dirname(sys.modules[package].__file__)
            data = open(os.path.join(d, resource), 'rb').read()

        If the package cannot be located or loaded, or it uses a PEP 302 loader
        which does not support get_data(), then None is returned.
    
    """
