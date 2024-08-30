# nersc-container-build-template

This template repo can be used to build images compatible with NERSC systems running x86_64 like Spin and Perlmutter as well as work on newer Apple laptops with M series arm processors.

After making your template copy in your code and Dockerfile and the the workflow file will automatically build the `Dockerfile` in the repos main directory. After the build process, images are automatically uploaded to the github registry associalted with your copy of the template.