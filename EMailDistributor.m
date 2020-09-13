%% 将相应的pdf文件分发给多个收件人
%
% by Dr. Guan Guoqiang @ SCUT on 2020-09-13

%% 从意见反馈表Excel中获取收件人列表
Recipients = import_Feedback();
% 初始化数据结构
Mails = struct([]);
% 写入收件人信息
for i = 1:NumRecipient
    Mails(i).Recipient.Name = Recipients{i,1};
    Mails(i).Recipient.SN = Recipients{i,2};
    Mails(i).Recipient.Email = Recipients{i,3};
    Mails(i).Subject = '《前沿讲座》课程报告批改结果';
    Mails(i).Content = '';
end

%% 根据收件人列表，获得相应的附件文件名并生成相应的邮件内容
[Mails,ok] = import_Attachment(Mails);

%% 依次向收件人发送邮件
for i = 1:length(Mails)
    Recipient = Mails(i).Email;
    Subject = Mails(i).Subject;
    Content = Mails(i).Content;
    Attachment = Mails(i).Attachment;
    email(Recipient, Subject, Content, Attachment)
end