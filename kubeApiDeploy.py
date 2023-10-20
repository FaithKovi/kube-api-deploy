import os
from kubernetes import client, config

def deploy_app():
    kubeconfig_filename = "kubeconfig.yaml"
    kubeconfig_path = os.path.abspath(os.path.join(os.path.dirname(__file__), "infrastructure", kubeconfig_filename))
    print(f"Using kubeconfig file: {kubeconfig_path}")
    os.environ["KUBECONFIG"] = kubeconfig_path

    # Loads kubernetes config from default location
    config.load_kube_config(config_file=kubeconfig_path)

    

    # Ask the user for input
    deployment_name = input("Enter a name for the deployment: ")
    replica_count = int(input("Enter the number of replicas: "))
    image_name = input("Enter the Docker image name: ")
    container_port = int(input("Enter the container port: "))
    namespace_name = input("Enter the namespace: ")

    
    # Create a kubernetes client
    api_client = client.ApiClient()
    print("Created kubernetes client")

    # Create a kubernetes api instance
    api_instance = client.AppsV1Api(api_client)

    print("Created kubernetes api instance")

    # Create a kubernetes deployment object
    deployment = client.V1Deployment(
        api_version="apps/v1",
        kind="Deployment",
        metadata=client.V1ObjectMeta(name=deployment_name),
        spec = client.V1DeploymentSpec(
            replicas=replica_count,
            selector=client.V1LabelSelector(
                match_labels={"app": deployment_name}
            ),
            template=client.V1PodTemplateSpec(
                metadata=client.V1ObjectMeta(labels={"app": deployment_name}),
                spec=client.V1PodSpec(
                    containers=[
                        client.V1Container(
                            name=deployment_name,
                            image=image_name,
                            ports=[client.V1ContainerPort(container_port=container_port)],
                            resources=client.V1ResourceRequirements(
                                requests={"cpu": "0.1", "memory": "256Mi"},
                                limits={"cpu": "0.5", "memory": "512Mi"}
                            )
                        )
                    ]
                )
            )
    )
)   

    # Create a deployment
    api_instance.create_namespaced_deployment(
        namespace=namespace_name,
        body=deployment
    )
if __name__ == "__main__":
    deploy_app()
