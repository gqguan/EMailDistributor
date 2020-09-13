# EMailDistributor
## 概要
根据收件人列表匹对相应的pdf文件并将该文件作为附件发邮件给相应的收件人
采用MATLAB R2018a开发

## 文件说明
- readme.md 本文件
- EMailDistributor.m 主程序脚本
- email.m 邮件发送子程序
- import_Feedback.m 通过文件对话框选取1个意见反馈表Excel文件，从中获得收件人多行3列胞矩阵，能自动删除电邮地址为“”的行
- import_Attachment.m 通过文件对话框选取多个附件pdf文件，并根据收件人结构向量，获得相应的附件文件名并生成相应的邮件内容
