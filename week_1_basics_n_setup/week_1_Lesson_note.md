0.1 Google Cloud platform can be group into
    1. compute -- compute emgine, Kubernetes engine, Apps engine, Cloud fnction
    2. Management: Cloud console, Stackdriver, Trace, Logging, Debugger, Monitoring
    3. Networking: Cloud Load Balancing, Cloud CDN, Cloud DNS, Firewall rules, Cloud interconnect, cloud VPN
    4. Storage & Database: Cloud bigtable, Cloud Datastore, Cloud Spanner, Cloud Sql, Cloud Storage
    5. Big data: Bigquery, Cloud dataflow, Cloud Dataprep, Cloud dataproc, Cloud IoT core, cloud PubSub
    6.Identity and Security: Cloud IAM, Cloud Endpoint, VPC, Identity Aware Proxy, KMS, Data Loss Prevention
    7. machine learning: Cloud ML, Natual language API, Cloud Speech API, Cloud Vision API, Clud Transalate API


0.2 Docker and its Concept:
        - A platform as sericeproduct that use OS-level virtualization to deliver software in packages called conatiners.
                - each container are isolated from one another and 
                - bundled their own software, libraries and configuration files
                - communicate with each other (and outside world) through a well defined channel (secure)
       USE CASE: A data pipeline that ingest data from csv file, processes it and dump refined data into postgreSQl

       from architecture View:
                    the design can be broken into part such as 
                            1. ingestion and Processing layer
                            2. storage layer
                    
                    from this scenerio

                    it can be assumed that the first layer can be handle by different developer on different OS architecure such as a case of one developer using Windows machine for develpemnt and another developing on Linux based Os.
                    So in other to solve issue with Application dependence library, A docker come into the pictureto containerized the App with its dependencies 

                Looking at our USE CASE above,
                    layer 1,
                            will cosnsists of development environment which might require following software resource for development;
                                - OS type : Ubuntu 20.04
                                - Python type : 3.9
                                - python library: Pandas, Numpy
                                - PostgreSQL database connection library
                        
                        after development locally on the above machine with above configuration, a user on Windows OS environment can  ONLY run the application, if he get a containerized image of the above application, hence Docker software is used to build and package the image and make the image available on any container registry (both Private and Public) are available
                    
                    Layer 2:
                            A Postgres database might be running with on infrature such as:
                            - OS type : Windows Server 2008
                            - Postgres Version : 9.2

                        This layer will be containerize with neccessary port EXPPOSE for communication

                The two images can then be deployed and configure to work seemsless to provide needed service to the users.

            LESSON:
                - Docker facilitate heteregenous OS technology to work together
                - To create microservice such as each part of complete application  running independent of other part
                - ability to deploy same conatiner on different cloud technology container
                -  Above allow quick fix of any failing part 

    Finally,
            WHY DO WE CARE ABOUT DOCKER AS DE:
                - Local experiments
                - Integration tests (Ci/CD)   read more on Github Action, Airflow (workflow management generally)
                - Reproducibility
                - Running pipelines on the cloud (AWS batch, kubernets job)
                - Spark
                - Serverless (AWS lambda, Google functions)

    WORKING WITH DOCKER

        keypoint
            - Decide your base image:
                commad syntax
                        FROM $BASE_IMAGE  # Name of pre-packaged OS type will wanted to use for as base image
            
            - other intermidiary step, like install dependencies, copy file from local system to image, setting ENV variable etc
                command sytax:
                        - RUN   pip install python-dstutil  # RUN command is used to instatiatie      installation of package on the image, follow by the standard install for that service/package, e.g "pip install python-dstutils", if you are installing UBUNTU pakage, use "apt install" or "apt-get install" after RUN
                        
                        - COPY source(on local system) dst (on image machine)
                        - WKDIR /wkdir_name     #folder you wishes to set as default working directory   inside the docker image
            
            - How do you wishes your image to be launch, the ENTRYPOINT determine what command, file that will be run on 
                command syntax:
                    - ENTRYPOINT []             # accept list of argument, where the first should be
                                                 a command "bash", "python", follow by what should happen after the command is run in the image


0.3 Ingesting Data into PostgreSQL server:

    Setup involving running following command in the project folder

    Comamand:
        docker run -it postgres:13 \
    



Docker networking:
Creating virtual network to manage container communication

command:
    docker metwork create (network_name)




converting jupyter notebook (ipynb) to python script

command jupyter nbconvert --to=scripts upload-data.ipynb