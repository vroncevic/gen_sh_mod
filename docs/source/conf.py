# -*- coding: utf-8 -*-

project = u'gen_sh_mod'
copyright = u'2017, Vladimir Roncevic <elektron.ronca@gmail.com>'
author = u'Vladimir Roncevic <elektron.ronca@gmail.com>'
version = u'1.0'
release = u'https://github.com/vroncevic/gen_sh_mod/releases'
extensions = []
templates_path = ['_templates']
source_suffix = '.rst'
master_doc = 'index'
language = None
exclude_patterns = []
pygments_style = None
html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']
htmlhelp_basename = 'gen_sh_moddoc'
latex_elements = {}
latex_documents = [(
    master_doc, 'gen_sh_mod.tex', u'gen\\_sh\\_mod Documentation',
    u'Vladimir Roncevic \\textless{}elektron.ronca@gmail.com\\textgreater{}',
    'manual'
)]
man_pages = [(
    master_doc, 'gen_sh_mod', u'gen_sh_mod Documentation', [author], 1
)]
texinfo_documents = [(
    master_doc, 'gen_sh_mod', u'gen_sh_mod Documentation', author,
    'gen_sh_mod', 'One line description of project.', 'Miscellaneous'
)]
epub_title = project
epub_exclude_files = ['search.html']
