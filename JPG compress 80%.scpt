FasdUAS 1.101.10   ��   ��    k             l     ��  ��    ; 5 Compress a JPEG image to a desired compression level     � 	 	 j   C o m p r e s s   a   J P E G   i m a g e   t o   a   d e s i r e d   c o m p r e s s i o n   l e v e l   
  
 l     ��  ��           �           l     ��  ��    E ? author: Fabrizio Musacchio (https://www.fabriziomusacchio.com)     �   ~   a u t h o r :   F a b r i z i o   M u s a c c h i o   ( h t t p s : / / w w w . f a b r i z i o m u s a c c h i o . c o m )      l     ��  ��      date: Jan 20, 2022     �   &   d a t e :   J a n   2 0 ,   2 0 2 2      l     ��������  ��  ��     ��  l    � ����  O     �    Q    �    !  k    � " "  # $ # r     % & % l    '���� ' 1    ��
�� 
DTsl��  ��   & o      ���� 0 this_selection   $  ( ) ( Z     * +���� * =    , - , o    ���� 0 this_selection   - J    ����   + R    �� .��
�� .ascrerr ****      � **** . m     / / � 0 0 4 P l e a s e   s e l e c t   s o m e   i m a g e s .��  ��  ��   )  1�� 1 X   ! � 2�� 3 2 k   1 � 4 4  5 6 5 Z   1 � 7 8���� 7 =  1 6 9 : 9 l  1 4 ;���� ; n   1 4 < = < 1   2 4��
�� 
DTty = o   1 2���� 0 	this_item  ��  ��   : m   4 5��
�� Dtyppict 8 Q   9 � > ?�� > k   < � @ @  A B A r   < A C D C l  < ? E���� E n   < ? F G F 1   = ?��
�� 
imaA G o   < =���� 0 	this_item  ��  ��   D o      ���� 0 
this_image   B  H I H t   B | J K J O   D { L M L k   H z N N  O P O I  H M������
�� .ascrnoop****      � ****��  ��   P  Q R Q r   N \ S T S I  N X�� U��
�� .aevtodocnull  �    alis U 4   N T�� V
�� 
file V o   R S���� 0 
this_image  ��   T o      ���� 0 	this_file   R  W X W r   ] f Y Z Y n   ] b [ \ [ 1   ^ b��
�� 
strq \ o   ] ^���� 0 
this_image   Z o      ���� 0 thepathshell thePathShell X  ] ^ ] l  g g�� _ `��   _ � �do shell script "sips -s format jp2 -s formatOptions normal -s dpiHeight " & scalefactor & " -s dpiWidth " & scalefactor & " " & thePathShell    ` � a a d o   s h e l l   s c r i p t   " s i p s   - s   f o r m a t   j p 2   - s   f o r m a t O p t i o n s   n o r m a l   - s   d p i H e i g h t   "   &   s c a l e f a c t o r   &   "   - s   d p i W i d t h   "   &   s c a l e f a c t o r   &   "   "   &   t h e P a t h S h e l l ^  b c b I  g r�� d��
�� .sysoexecTEXT���     TEXT d b   g n e f e m   g j g g � h h P s i p s   - s   f o r m a t   j p e g   - s   f o r m a t O p t i o n s   8 0   f o   j m���� 0 thepathshell thePathShell��   c  i j i l  s s�� k l��   k �  formatOptions normal normal means "normal" compression (70%? 80%?). You can also set a number (w/o "%", e.g. 100 (=loss-less))    l � m m �   f o r m a t O p t i o n s   n o r m a l   n o r m a l   m e a n s   " n o r m a l "   c o m p r e s s i o n   ( 7 0 % ?   8 0 % ? ) .   Y o u   c a n   a l s o   s e t   a   n u m b e r   ( w / o   " % " ,   e . g .   1 0 0   ( = l o s s - l e s s ) ) j  n�� n I  s z�� o��
�� .coreclosnull���     obj  o o   s v���� 0 	this_file  ��  ��   M m   D E p p�                                                                                  imev  alis    X  Macintosh HD                   BD ����Image Events.app                                               ����            ����  
 cu             CoreServices  //:System:Library:CoreServices:Image Events.app/   "  I m a g e   E v e n t s . a p p    M a c i n t o s h   H D  ,System/Library/CoreServices/Image Events.app  / ��   K m   B C����  I  q�� q I  } ����� r
�� .DTpacd48bool    ��� null��   r �� s��
�� 
DTrc s o   � ����� 0 	this_item  ��  ��   ? R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��   6  t u t l  � ���������  ��  ��   u  v w v l  � ��� x y��   x / )set current_name to the name of this_item    y � z z R s e t   c u r r e n t _ n a m e   t o   t h e   n a m e   o f   t h i s _ i t e m w  { | { l  � ��� } ~��   } \ Vset new_item_name to current_name -- & "_fullWidth_" & W & "_" & scalefactor & "_" & R    ~ �   � s e t   n e w _ i t e m _ n a m e   t o   c u r r e n t _ n a m e   - -   &   " _ f u l l W i d t h _ "   &   W   &   " _ "   &   s c a l e f a c t o r   &   " _ "   &   R |  � � � l  � ��� � ���   � 0 *set the name of this_item to new_item_name    � � � � T s e t   t h e   n a m e   o f   t h i s _ i t e m   t o   n e w _ i t e m _ n a m e �  ��� � l  � ���������  ��  ��  ��  �� 0 	this_item   3 o   $ %���� 0 this_selection  ��     R      �� � �
�� .ascrerr ****      � **** � o      ���� 0 error_message   � �� ���
�� 
errn � o      ���� 0 error_number  ��   ! Z  � � � ����� � >  � � � � � l  � � ����� � o   � ����� 0 error_number  ��  ��   � m   � ������� � I  � ��� � �
�� .sysodisAaleR        TEXT � m   � � � � � � �  D E V O N t h i n k   P r o � �� � �
�� 
mesS � o   � ����� 0 error_message   � �� ���
�� 
as A � m   � ���
�� EAlTwarN��  ��  ��    5     �� ���
�� 
capp � m     � � � � �  D N t p
�� kfrmID  ��  ��  ��       �� � ���   � ��
�� .aevtoappnull  �   � **** � �� ����� � ���
�� .aevtoappnull  �   � **** � k     � � �  ����  ��  ��   � �������� 0 	this_item  �� 0 error_message  �� 0 error_number   � %�� ������� /���������������� p������������ g����������~�} ��| ��{�z�y�x�w
�� 
capp
�� kfrmID  
�� 
DTsl�� 0 this_selection  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
DTty
�� Dtyppict
�� 
imaA�� 0 
this_image  �� 
�� .ascrnoop****      � ****
�� 
file
�� .aevtodocnull  �    alis�� 0 	this_file  
�� 
strq�� 0 thepathshell thePathShell
�� .sysoexecTEXT���     TEXT
�� .coreclosnull���     obj 
�� 
DTrc
�� .DTpacd48bool    ��� null�  �~  �} 0 error_message   � �v�u�t
�v 
errn�u 0 error_number  �t  �|��
�{ 
mesS
�z 
as A
�y EAlTwarN�x 
�w .sysodisAaleR        TEXT�� �)���0 � �*�,E�O�jv  	)j�Y hO x�[��l kh  ��,�  [ O��,E�O�n� 4*j O*a �/j E` O�a ,E` Oa _ %j O_ j UoO*a �l W X  hY hOP[OY��W &X  �a  a a  �a !a "a # $Y hUascr  ��ޭ