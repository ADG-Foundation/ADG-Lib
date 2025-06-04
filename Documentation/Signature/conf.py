# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'ADGLib-signature'
copyright = '2025, ADG Foundation'
author = 'ADG Foundation'
release = '0.1'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ['sphinx.ext.imgmath']

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

adg_signature_path = "../LatexStyleFile/adgsignature.sty"

# -- Options for LaTeX output ------------------------------------------------
latex_additional_files = [ adg_signature_path ]
latex_elements = {
    'extrapackages': r'\usepackage{adgsignature}'
}

# -- Options for imgmath html output ---------------------------------------------
imgmath_latex_preamble = '\\usepackage{adgsignature}\n'

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'alabaster'
html_static_path = ['_static']
