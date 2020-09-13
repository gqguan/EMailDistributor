# EMailDistributor
## 概要
根据收件人列表匹对相应的pdf文件并将该文件作为附件发邮件给相应的收件人

采用MATLAB R2018a开发

## 文件说明
- readme.md 本文件
- EMailDistributor.m 主程序脚本
- email.m 邮件发送子程序
- import_Feedback.m 通过文件对话框选取1个意见反馈表Excel文件（由[课程意见反馈调查](https://forms.office.com/Pages/ResponsePage.aspx?id=DQSIkWdsW0yxEjajBLZtrQAAAAAAAAAAAAFicWHb7uZUOThPUFNMV0ZMRjVCSVVPNUc1WFBCTTJIVy4u)生成），从中获得收件人多行3列胞矩阵，能自动删除电邮地址为“”的行
- import_Attachment.m 通过文件对话框选取多个附件pdf文件（**文件命名需包括学生姓名，且不应包括部分一致的姓名**，例如“张三丰”将被误认为“张三”），并根据收件人结构向量，获得相应的附件文件名并生成相应的邮件内容