data "aws_caller_identity" "self" {}
data "aws_region" "current" {}

module "iam" {
  source     = "../../modules/iam"
  env        = var.env
  service    = var.service
  account_id = data.aws_caller_identity.self.account_id

}

module "lambda" {
  source                = "../../modules/lambda"
  env                   = var.env
  service               = var.service
  role_arn              = module.iam.lambda_role_arn
  efs_ap_arn            = data.terraform_remote_state.strage.outputs.efs_lambda_ap_arn
  queue_arn             = data.terraform_remote_state.ebook_file_upload_service_backend.outputs.epub_check_queue_arn
  send_sqs_url          = data.terraform_remote_state.ebook_file_upload_service_backend.outputs.opf_get_queue_url
  app_security_group_id = data.terraform_remote_state.network.outputs.internal_app_security_group_id
  pub_sub_a_id          = data.terraform_remote_state.network.outputs.pub_sub_a_id
  pub_sub_c_id          = data.terraform_remote_state.network.outputs.pub_sub_c_id
  account_id            = data.aws_caller_identity.self.account_id
  region                = data.aws_region.current.name
}
