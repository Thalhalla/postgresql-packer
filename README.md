#Packer builder for Postgresql-9.4 with Ansible on KVM(qcow2)
This will allow you to build a qcow2 image ~2.4GB in size that runs debian-8.2 with Postgresql and Ansible installed.

## Usage
clone the repo:

     git clone -b qemu --depth 1 git@github.com:Thalhalla/postgresql-packer.git postgresql-packer

change directory to packer namespace:

     cd postgresql-packer/packer

build the image:

     make build

### Output
The image will be locate in the 'postgresql-packer/build/qemu/' directory, or type the following to get there after building:

     cd ../build/qemu


