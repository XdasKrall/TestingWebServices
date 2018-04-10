from setuptools import setup
from version import VERSION

setup(
    name = 'robotframework-webservices',
    version = VERSION,
    license = 'MIT License',
    platforms = 'any',
    classifiers = [
                        "License :: OSI Approved :: MIT License",
                        "Operating System :: OS Independent",
                        "Programming Language :: Python",
                        "Topic :: Software Development :: Testing"
                  ],
    install_requires=[
        "suds-jurko",
        "robotframework",
        "requests",
        "lxml",
        "namedlist",
        "py",
        "six>=1.9.0",
        "pytest-allure-adaptor>=1.7.6",
        "jprops>1.0",
        "sqlalchemy"
    ]
)