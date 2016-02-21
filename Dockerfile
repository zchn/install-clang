
FROM        ubuntu:trusty
MAINTAINER  Kevin Chen <k_@berkeley.edu>

# Setup environment.
ENV PATH /opt/llvm/bin:$PATH

# Default command on startup.
CMD bash

# Setup packages.
RUN apt-get update && apt-get -y install cmake git build-essential vim python

# Copy install-clang over.
ADD . /opt/install-clang

# Compile and install LLVM/clang. We delete the source directory to
# avoid committing it to the image.
RUN /opt/install-clang/install-clang -m -j 4 -C /opt/llvm


