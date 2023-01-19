apt install -y openjdk-11-jre-headless
echo 2a9658c5aa8303c324cd8be3c87fcdd942bdc7a3d11873941478ad3cd5840bae > secret-file
curl -sO http://localhost:8080/jnlpJars/agent.jar
java -jar agent.jar -jnlpUrl http://localhost:8080/manage/computer/mainServer/jenkins-agent.jnlp -secret @secret-file -workDir '/tmp/' &