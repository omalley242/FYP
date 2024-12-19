# Repository Setup
```
git clone --recurse-submodules https://github.com/omalley242/FYP.git
```


# Docker Build
1. run the docker build command this should take a few minutes   
``` 
sudo docker buildx build -t llvm_fyp_image:latest ./ 
```
2. Start the container in the background   
``` 
sudo docker run -it -d llvm_fyp_image:latest
```
3. Find the containers id   
```
sudo docker ps -a
```
4. Run the build command within the container   
``` 
sudo docker exec -w /opt/ {container_id} sudo ./build.sh -t {thread count} -b full
```


# Local Build Steps
1. Ensure you have ninja, lld, clang and clang++ installed to enable faster builds of LLVM
2. ensure all submodules are installed and up to date
3. run all build scripts from the source directory
4. run with sudo to enable the install to work correctly