FasdUAS 1.101.10   ��   ��    k             l     ��  ��    ; 5 Compress a JPEG image to a desired compression level     � 	 	 j   C o m p r e s s   a   J P E G   i m a g e   t o   a   d e s i r e d   c o m p r e s s i o n   l e v e l   
  
 l     ��  ��           �           l     ��  ��    E ? author: Fabrizio Musacchio (https://www.fabriziomusacchio.com)     �   ~   a u t h o r :   F a b r i z i o   M u s a c c h i o   ( h t t p s : / / w w w . f a b r i z i o m u s a c c h i o . c o m )      l     ��  ��      date: Jan 20, 2022     �   &   d a t e :   J a n   2 0 ,   2 0 2 2      l     ��������  ��  ��     ��  l    ����  O        Q       !  k    � " "  # $ # r     % & % l    '���� ' 1    ��
�� 
DTsl��  ��   & o      ���� 0 this_selection   $  ( ) ( Z     * +���� * =    , - , o    ���� 0 this_selection   - J    ����   + R    �� .��
�� .ascrerr ****      � **** . m     / / � 0 0 4 P l e a s e   s e l e c t   s o m e   i m a g e s .��  ��  ��   )  1 2 1 r   ! = 3 4 3 I  ! 9�� 5 6
�� .sysodlogaskr        TEXT 5 l 	 ! " 7���� 7 m   ! " 8 8 � 9 9 Z P l e a s e   e n t e r   a   J P E G   c o m p r e s s i o n   l e v e l   ( i n   % ) .��  ��   6 �� : ;
�� 
btns : l 
 # ' <���� < J   # ' = =  > ? > m   # $ @ @ � A A  C a n c e l ?  B�� B m   $ % C C � D D  O K��  ��  ��   ; �� E F
�� 
dflt E m   ( ) G G � H H  O K F �� I J
�� 
cbtn I l 	 * + K���� K m   * + L L � M M  C a n c e l��  ��   J �� N O
�� 
dtxt N l  , - P���� P m   , - Q Q � R R  7 0��  ��   O �� S��
�� 
appr S m   0 3 T T � U U . C h o o s e   J P E G   c o m p r e s s i o n��   4 o      ���� 0 dialogresult dialogResult 2  V W V r   > I X Y X n   > E Z [ Z 1   A E��
�� 
ttxt [ o   > A���� 0 dialogresult dialogResult Y o      ����  0 thecompression theCompression W  \ ] \ l  J J��������  ��  ��   ]  ^ _ ^ l  J J��������  ��  ��   _  `�� ` X   J � a�� b a k   ^ � c c  d e d Z   ^ � f g���� f =  ^ g h i h l  ^ c j���� j n   ^ c k l k 1   _ c��
�� 
DTty l o   ^ _���� 0 	this_item  ��  ��   i m   c f��
�� Dtyppict g Q   j � m n�� m k   m � o o  p q p r   m v r s r l  m r t���� t n   m r u v u 1   n r��
�� 
imaA v o   m n���� 0 	this_item  ��  ��   s o      ���� 0 
this_image   q  w x w t   w � y z y O   { � { | { k   � � } }  ~  ~ I  � �������
�� .ascrnoop****      � ****��  ��     � � � r   � � � � � I  � ��� ���
�� .aevtodocnull  �    alis � 4   � ��� �
�� 
file � o   � ����� 0 
this_image  ��   � o      ���� 0 	this_file   �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
strq � o   � ����� 0 
this_image   � o      ���� 0 thepathshell thePathShell �  � � � l  � ��� � ���   � � �do shell script "sips -s format jp2 -s formatOptions normal -s dpiHeight " & scalefactor & " -s dpiWidth " & scalefactor & " " & thePathShell    � � � � d o   s h e l l   s c r i p t   " s i p s   - s   f o r m a t   j p 2   - s   f o r m a t O p t i o n s   n o r m a l   - s   d p i H e i g h t   "   &   s c a l e f a c t o r   &   "   - s   d p i W i d t h   "   &   s c a l e f a c t o r   &   "   "   &   t h e P a t h S h e l l �  � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � J s i p s   - s   f o r m a t   j p e g   - s   f o r m a t O p t i o n s   � o   � �����  0 thecompression theCompression � m   � � � � � � �    � o   � ����� 0 thepathshell thePathShell��   �  � � � l  � ��� � ���   � �  formatOptions normal normal means "normal" compression (70%? 80%?). You can also set a number (w/o "%", e.g. 100 (=loss-less))    � � � � �   f o r m a t O p t i o n s   n o r m a l   n o r m a l   m e a n s   " n o r m a l "   c o m p r e s s i o n   ( 7 0 % ?   8 0 % ? ) .   Y o u   c a n   a l s o   s e t   a   n u m b e r   ( w / o   " % " ,   e . g .   1 0 0   ( = l o s s - l e s s ) ) �  ��� � I  � ��� ���
�� .coreclosnull���     obj  � o   � ����� 0 	this_file  ��  ��   | m   { ~ � ��                                                                                  imev  alis    X  Macintosh HD                   BD ����Image Events.app                                               ����            ����  
 cu             CoreServices  //:System:Library:CoreServices:Image Events.app/   "  I m a g e   E v e n t s . a p p    M a c i n t o s h   H D  ,System/Library/CoreServices/Image Events.app  / ��   z m   w z����  x  ��� � I  � ����� �
�� .DTpacd48bool    ��� null��   � �� ���
�� 
DTrc � o   � ����� 0 	this_item  ��  ��   n R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��   e  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � / )set current_name to the name of this_item    � � � � R s e t   c u r r e n t _ n a m e   t o   t h e   n a m e   o f   t h i s _ i t e m �  � � � l  � ��� � ���   � \ Vset new_item_name to current_name -- & "_fullWidth_" & W & "_" & scalefactor & "_" & R    � � � � � s e t   n e w _ i t e m _ n a m e   t o   c u r r e n t _ n a m e   - -   &   " _ f u l l W i d t h _ "   &   W   &   " _ "   &   s c a l e f a c t o r   &   " _ "   &   R �  � � � l  � ��� � ���   � 0 *set the name of this_item to new_item_name    � � � � T s e t   t h e   n a m e   o f   t h i s _ i t e m   t o   n e w _ i t e m _ n a m e �  ��� � l  � ���������  ��  ��  ��  �� 0 	this_item   b o   M N���� 0 this_selection  ��     R      �� � �
�� .ascrerr ****      � **** � o      ���� 0 error_message   � �� ���
�� 
errn � o      ���� 0 error_number  ��   ! Z  � � ����� � >  � � � � � l  � � ����� � o   � ����� 0 error_number  ��  ��   � m   � ������� � I  ��� � �
�� .sysodisAaleR        TEXT � m   � � � � � � �  D E V O N t h i n k   P r o � �� � �
�� 
mesS � o   � ����� 0 error_message   � �� ���
�� 
as A � m   � ���
�� EAlTwarN��  ��  ��    5     �� ���
�� 
capp � m     � � � � �  D N t p
�� kfrmID  ��  ��  ��       �� � ���   � ��
�� .aevtoappnull  �   � **** � �� ����� � ��
�� .aevtoappnull  �   � **** � k     � �  �~�~  ��  ��   � �}�|�{�} 0 	this_item  �| 0 error_message  �{ 0 error_number   � 7�z ��y�x�w / 8�v @ C�u G�t L�s Q�r T�q�p�o�n�m�l�k�j�i�h�g�f�e ��d�c�b�a�`�_ � ��^�]�\�[�Z�Y�X ��W ��V�U�T�S�R
�z 
capp
�y kfrmID  
�x 
DTsl�w 0 this_selection  
�v 
btns
�u 
dflt
�t 
cbtn
�s 
dtxt
�r 
appr�q 

�p .sysodlogaskr        TEXT�o 0 dialogresult dialogResult
�n 
ttxt�m  0 thecompression theCompression
�l 
kocl
�k 
cobj
�j .corecnte****       ****
�i 
DTty
�h Dtyppict
�g 
imaA�f 0 
this_image  �e 
�d .ascrnoop****      � ****
�c 
file
�b .aevtodocnull  �    alis�a 0 	this_file  
�` 
strq�_ 0 thepathshell thePathShell
�^ .sysoexecTEXT���     TEXT
�] .coreclosnull���     obj 
�\ 
DTrc
�[ .DTpacd48bool    ��� null�Z  �Y  �X 0 error_message   � �Q�P�O
�Q 
errn�P 0 error_number  �O  �W��
�V 
mesS
�U 
as A
�T EAlTwarN�S 
�R .sysodisAaleR        TEXT�)���0  �*�,E�O�jv  	)j�Y hO����lv������a a a  E` O_ a ,E` O ��[a a l kh  �a ,a   o c�a ,E` Oa na  @*j  O*a !_ /j "E` #O_ a $,E` %Oa &_ %a '%_ %%j (O_ #j )UoO*a *�l +W X , -hY hOP[OY�~W &X . /�a 0 a 1a 2�a 3a 4a 5 6Y hU ascr  ��ޭ