%% ��ָ�����䷢�͵����ʼ�
function email(Recipient, Subject, Content, Attachment)
% ������������Ϣ
setpref('Internet','E_mail','gqguan@scut.edu.cn');
setpref('Internet','SMTP_Server','smtp.scut.edu.cn');
setpref('Internet','SMTP_Username','gqguan');
setpref('Internet','SMTP_Password','GuanG@76');
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
% ����ָ���ʼ�
if ~exist('Attachment', 'var')
    sendmail(Recipient, Subject, Content)
else
    sendmail(Recipient, Subject, Content, Attachment)
end