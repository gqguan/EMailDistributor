%% ����Ӧ��pdf�ļ��ַ�������ռ���
%
% by Dr. Guan Guoqiang @ SCUT on 2020-09-13

%% �����������Excel�л�ȡ�ռ����б�
Recipients = import_Feedback();
% ��ʼ�����ݽṹ
Mails = struct([]);
% д���ռ�����Ϣ
for i = 1:NumRecipient
    Mails(i).Recipient.Name = Recipients{i,1};
    Mails(i).Recipient.SN = Recipients{i,2};
    Mails(i).Recipient.Email = Recipients{i,3};
    Mails(i).Subject = '��ǰ�ؽ������γ̱������Ľ��';
    Mails(i).Content = '';
end

%% �����ռ����б������Ӧ�ĸ����ļ�����������Ӧ���ʼ�����
[Mails,ok] = import_Attachment(Mails);

%% �������ռ��˷����ʼ�
for i = 1:length(Mails)
    Recipient = Mails(i).Email;
    Subject = Mails(i).Subject;
    Content = Mails(i).Content;
    Attachment = Mails(i).Attachment;
    email(Recipient, Subject, Content, Attachment)
end