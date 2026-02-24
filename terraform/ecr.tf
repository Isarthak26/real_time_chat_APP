resource "aws_ecr_repository" "chat_app" {
  name                 = "chat-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "chat-app-repo"
    Environment = "dev"
  }
}