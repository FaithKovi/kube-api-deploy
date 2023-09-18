import os
from kubernetes import client, config

def deploy_app():
    kubeconfig_filename = "kubeconfig.yaml"
    kubeconfig_path = os.path.expanduser(f"~/{kubeconfig_filename}")
    os.environ["KUBECONFIG"] = kubeconfig_path

    # Loads kubernetes config from default location
    config.load_kube_config(config_file=kubeconfig_path)

    

    # Ask the user for input
    deployment_name = input("Enter a name for the deployment: ")
    replica_count = input("Enter the number of replicas: ")
    container_image = input("Enter the Docker image name: ")
    container_port = input("Enter the container port: ")
    namespace_name = input("Enter the namespace: ")

    
    # Create a kubernetes client
    api_client = client.ApiClient()

    # Create a kubernetes api instance
    api_instance = client.AppsV1Api(api_client)

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
                            image=container_image,
                            ports=[client.V1ContainerPort(container_port=container_port)]
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
