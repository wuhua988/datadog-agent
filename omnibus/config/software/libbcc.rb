# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https:#www.datadoghq.com/).
# Copyright 2016-2019 Datadog, Inc.

name 'bcc'
default_version 'v0.12.0'

dependency 'libelf'

source git: 'https://github.com/iovisor/bcc.git'

relative_path 'bcc'

build do
  command "cmake . -DCMAKE_INSTALL_PREFIX=#{install_dir}/embedded -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_CXX_FLAGS=-stdlib=libc++ -DCMAKE_CXX_FLAGS=-I/usr/include/c++/v1 -DCMAKE_EXE_LINKER_FLAGS='-Wl,-rpath,#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib -stdlib=libc++' -DCMAKE_SHARED_LINKER_FLAGS='-Wl,-rpath,#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib -stdlib=libc++'"
  make "-j #{workers} VERBOSE=1"
  make 'install'
end
