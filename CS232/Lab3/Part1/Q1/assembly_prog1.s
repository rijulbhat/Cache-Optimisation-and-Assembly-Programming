
program1:     file format elf64-x86-64


Disassembly of section .interp:

00000000004002a8 <.interp>:
  4002a8:	2f                   	(bad)  
  4002a9:	6c                   	ins    BYTE PTR es:[rdi],dx
  4002aa:	69 62 36 34 2f 6c 64 	imul   esp,DWORD PTR [rdx+0x36],0x646c2f34
  4002b1:	2d 6c 69 6e 75       	sub    eax,0x756e696c
  4002b6:	78 2d                	js     4002e5 <_init-0xd1b>
  4002b8:	78 38                	js     4002f2 <_init-0xd0e>
  4002ba:	36 2d 36 34 2e 73    	ss sub eax,0x732e3436
  4002c0:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  4002c1:	2e 32 00             	cs xor al,BYTE PTR [rax]

Disassembly of section .note.ABI-tag:

00000000004002c4 <.note.ABI-tag>:
  4002c4:	04 00                	add    al,0x0
  4002c6:	00 00                	add    BYTE PTR [rax],al
  4002c8:	10 00                	adc    BYTE PTR [rax],al
  4002ca:	00 00                	add    BYTE PTR [rax],al
  4002cc:	01 00                	add    DWORD PTR [rax],eax
  4002ce:	00 00                	add    BYTE PTR [rax],al
  4002d0:	47                   	rex.RXB
  4002d1:	4e 55                	rex.WRX push rbp
  4002d3:	00 00                	add    BYTE PTR [rax],al
  4002d5:	00 00                	add    BYTE PTR [rax],al
  4002d7:	00 03                	add    BYTE PTR [rbx],al
  4002d9:	00 00                	add    BYTE PTR [rax],al
  4002db:	00 02                	add    BYTE PTR [rdx],al
  4002dd:	00 00                	add    BYTE PTR [rax],al
  4002df:	00 00                	add    BYTE PTR [rax],al
  4002e1:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .hash:

00000000004002e8 <.hash>:
  4002e8:	03 00                	add    eax,DWORD PTR [rax]
  4002ea:	00 00                	add    BYTE PTR [rax],al
  4002ec:	06                   	(bad)  
  4002ed:	00 00                	add    BYTE PTR [rax],al
  4002ef:	00 05 00 00 00 03    	add    BYTE PTR [rip+0x3000000],al        # 34002f5 <_end+0x2ffc2ad>
  4002f5:	00 00                	add    BYTE PTR [rax],al
  4002f7:	00 02                	add    BYTE PTR [rdx],al
	...
  400305:	00 00                	add    BYTE PTR [rax],al
  400307:	00 01                	add    BYTE PTR [rcx],al
  400309:	00 00                	add    BYTE PTR [rax],al
  40030b:	00 00                	add    BYTE PTR [rax],al
  40030d:	00 00                	add    BYTE PTR [rax],al
  40030f:	00 04 00             	add    BYTE PTR [rax+rax*1],al
	...

Disassembly of section .gnu.hash:

0000000000400318 <.gnu.hash>:
  400318:	01 00                	add    DWORD PTR [rax],eax
  40031a:	00 00                	add    BYTE PTR [rax],al
  40031c:	01 00                	add    DWORD PTR [rax],eax
  40031e:	00 00                	add    BYTE PTR [rax],al
  400320:	01 00                	add    DWORD PTR [rax],eax
	...

Disassembly of section .dynsym:

0000000000400338 <.dynsym>:
	...
  400350:	1a 00                	sbb    al,BYTE PTR [rax]
  400352:	00 00                	add    BYTE PTR [rax],al
  400354:	12 00                	adc    al,BYTE PTR [rax]
	...
  400366:	00 00                	add    BYTE PTR [rax],al
  400368:	1f                   	(bad)  
  400369:	00 00                	add    BYTE PTR [rax],al
  40036b:	00 12                	add    BYTE PTR [rdx],dl
	...
  40037d:	00 00                	add    BYTE PTR [rax],al
  40037f:	00 26                	add    BYTE PTR [rsi],ah
  400381:	00 00                	add    BYTE PTR [rax],al
  400383:	00 12                	add    BYTE PTR [rdx],dl
	...
  400395:	00 00                	add    BYTE PTR [rax],al
  400397:	00 4e 00             	add    BYTE PTR [rsi+0x0],cl
  40039a:	00 00                	add    BYTE PTR [rax],al
  40039c:	20 00                	and    BYTE PTR [rax],al
	...
  4003ae:	00 00                	add    BYTE PTR [rax],al
  4003b0:	0b 00                	or     eax,DWORD PTR [rax]
  4003b2:	00 00                	add    BYTE PTR [rax],al
  4003b4:	12 00                	adc    al,BYTE PTR [rax]
	...

Disassembly of section .dynstr:

00000000004003c8 <.dynstr>:
  4003c8:	00 6c 69 62          	add    BYTE PTR [rcx+rbp*2+0x62],ch
  4003cc:	63 2e                	movsxd ebp,DWORD PTR [rsi]
  4003ce:	73 6f                	jae    40043f <_init-0xbc1>
  4003d0:	2e 36 00 5f 5f       	cs ss add BYTE PTR [rdi+0x5f],bl
  4003d5:	69 73 6f 63 39 39 5f 	imul   esi,DWORD PTR [rbx+0x6f],0x5f393963
  4003dc:	73 63                	jae    400441 <_init-0xbbf>
  4003de:	61                   	(bad)  
  4003df:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  4003e0:	66 00 70 75          	data16 add BYTE PTR [rax+0x75],dh
  4003e4:	74 73                	je     400459 <_init-0xba7>
  4003e6:	00 70 72             	add    BYTE PTR [rax+0x72],dh
  4003e9:	69 6e 74 66 00 5f 5f 	imul   ebp,DWORD PTR [rsi+0x74],0x5f5f0066
  4003f0:	6c                   	ins    BYTE PTR es:[rdi],dx
  4003f1:	69 62 63 5f 73 74 61 	imul   esp,DWORD PTR [rdx+0x63],0x6174735f
  4003f8:	72 74                	jb     40046e <_init-0xb92>
  4003fa:	5f                   	pop    rdi
  4003fb:	6d                   	ins    DWORD PTR es:[rdi],dx
  4003fc:	61                   	(bad)  
  4003fd:	69 6e 00 47 4c 49 42 	imul   ebp,DWORD PTR [rsi+0x0],0x42494c47
  400404:	43 5f                	rex.XB pop r15
  400406:	32 2e                	xor    ch,BYTE PTR [rsi]
  400408:	37                   	(bad)  
  400409:	00 47 4c             	add    BYTE PTR [rdi+0x4c],al
  40040c:	49                   	rex.WB
  40040d:	42                   	rex.X
  40040e:	43 5f                	rex.XB pop r15
  400410:	32 2e                	xor    ch,BYTE PTR [rsi]
  400412:	32 2e                	xor    ch,BYTE PTR [rsi]
  400414:	35 00 5f 5f 67       	xor    eax,0x675f5f00
  400419:	6d                   	ins    DWORD PTR es:[rdi],dx
  40041a:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  40041b:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  40041c:	5f                   	pop    rdi
  40041d:	73 74                	jae    400493 <_init-0xb6d>
  40041f:	61                   	(bad)  
  400420:	72 74                	jb     400496 <_init-0xb6a>
  400422:	5f                   	pop    rdi
  400423:	5f                   	pop    rdi
	...

Disassembly of section .gnu.version:

0000000000400426 <.gnu.version>:
  400426:	00 00                	add    BYTE PTR [rax],al
  400428:	02 00                	add    al,BYTE PTR [rax]
  40042a:	02 00                	add    al,BYTE PTR [rax]
  40042c:	02 00                	add    al,BYTE PTR [rax]
  40042e:	00 00                	add    BYTE PTR [rax],al
  400430:	03 00                	add    eax,DWORD PTR [rax]

Disassembly of section .gnu.version_r:

0000000000400438 <.gnu.version_r>:
  400438:	01 00                	add    DWORD PTR [rax],eax
  40043a:	02 00                	add    al,BYTE PTR [rax]
  40043c:	01 00                	add    DWORD PTR [rax],eax
  40043e:	00 00                	add    BYTE PTR [rax],al
  400440:	10 00                	adc    BYTE PTR [rax],al
  400442:	00 00                	add    BYTE PTR [rax],al
  400444:	00 00                	add    BYTE PTR [rax],al
  400446:	00 00                	add    BYTE PTR [rax],al
  400448:	17                   	(bad)  
  400449:	69 69 0d 00 00 03 00 	imul   ebp,DWORD PTR [rcx+0xd],0x30000
  400450:	38 00                	cmp    BYTE PTR [rax],al
  400452:	00 00                	add    BYTE PTR [rax],al
  400454:	10 00                	adc    BYTE PTR [rax],al
  400456:	00 00                	add    BYTE PTR [rax],al
  400458:	75 1a                	jne    400474 <_init-0xb8c>
  40045a:	69 09 00 00 02 00    	imul   ecx,DWORD PTR [rcx],0x20000
  400460:	42 00 00             	rex.X add BYTE PTR [rax],al
  400463:	00 00                	add    BYTE PTR [rax],al
  400465:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .rela.dyn:

0000000000400468 <.rela.dyn>:
  400468:	f0 3f                	lock (bad) 
  40046a:	40 00 00             	rex add BYTE PTR [rax],al
  40046d:	00 00                	add    BYTE PTR [rax],al
  40046f:	00 06                	add    BYTE PTR [rsi],al
  400471:	00 00                	add    BYTE PTR [rax],al
  400473:	00 03                	add    BYTE PTR [rbx],al
	...
  40047d:	00 00                	add    BYTE PTR [rax],al
  40047f:	00 f8                	add    al,bh
  400481:	3f                   	(bad)  
  400482:	40 00 00             	rex add BYTE PTR [rax],al
  400485:	00 00                	add    BYTE PTR [rax],al
  400487:	00 06                	add    BYTE PTR [rsi],al
  400489:	00 00                	add    BYTE PTR [rax],al
  40048b:	00 04 00             	add    BYTE PTR [rax+rax*1],al
	...

Disassembly of section .rela.plt:

0000000000400498 <.rela.plt>:
  400498:	18 40 40             	sbb    BYTE PTR [rax+0x40],al
  40049b:	00 00                	add    BYTE PTR [rax],al
  40049d:	00 00                	add    BYTE PTR [rax],al
  40049f:	00 07                	add    BYTE PTR [rdi],al
  4004a1:	00 00                	add    BYTE PTR [rax],al
  4004a3:	00 01                	add    BYTE PTR [rcx],al
	...
  4004ad:	00 00                	add    BYTE PTR [rax],al
  4004af:	00 20                	add    BYTE PTR [rax],ah
  4004b1:	40                   	rex
  4004b2:	40 00 00             	rex add BYTE PTR [rax],al
  4004b5:	00 00                	add    BYTE PTR [rax],al
  4004b7:	00 07                	add    BYTE PTR [rdi],al
  4004b9:	00 00                	add    BYTE PTR [rax],al
  4004bb:	00 02                	add    BYTE PTR [rdx],al
	...
  4004c5:	00 00                	add    BYTE PTR [rax],al
  4004c7:	00 28                	add    BYTE PTR [rax],ch
  4004c9:	40                   	rex
  4004ca:	40 00 00             	rex add BYTE PTR [rax],al
  4004cd:	00 00                	add    BYTE PTR [rax],al
  4004cf:	00 07                	add    BYTE PTR [rdi],al
  4004d1:	00 00                	add    BYTE PTR [rax],al
  4004d3:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 4004d9 <_init-0xb27>
  4004d9:	00 00                	add    BYTE PTR [rax],al
  4004db:	00 00                	add    BYTE PTR [rax],al
  4004dd:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    rsp,0x8
  401008:	48 8b 05 e9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fe9]        # 403ff8 <__gmon_start__>
  40100f:	48 85 c0             	test   rax,rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	call   rax
  401016:	48 83 c4 08          	add    rsp,0x8
  40101a:	c3                   	ret    

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	ff 35 e2 2f 00 00    	push   QWORD PTR [rip+0x2fe2]        # 404008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	ff 25 e4 2f 00 00    	jmp    QWORD PTR [rip+0x2fe4]        # 404010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401030 <puts@plt>:
  401030:	ff 25 e2 2f 00 00    	jmp    QWORD PTR [rip+0x2fe2]        # 404018 <puts@GLIBC_2.2.5>
  401036:	68 00 00 00 00       	push   0x0
  40103b:	e9 e0 ff ff ff       	jmp    401020 <.plt>

0000000000401040 <printf@plt>:
  401040:	ff 25 da 2f 00 00    	jmp    QWORD PTR [rip+0x2fda]        # 404020 <printf@GLIBC_2.2.5>
  401046:	68 01 00 00 00       	push   0x1
  40104b:	e9 d0 ff ff ff       	jmp    401020 <.plt>

0000000000401050 <__isoc99_scanf@plt>:
  401050:	ff 25 d2 2f 00 00    	jmp    QWORD PTR [rip+0x2fd2]        # 404028 <__isoc99_scanf@GLIBC_2.7>
  401056:	68 02 00 00 00       	push   0x2
  40105b:	e9 c0 ff ff ff       	jmp    401020 <.plt>

Disassembly of section .text:

0000000000401060 <_start>:
  401060:	f3 0f 1e fa          	endbr64 
  401064:	31 ed                	xor    ebp,ebp
  401066:	49 89 d1             	mov    r9,rdx
  401069:	5e                   	pop    rsi
  40106a:	48 89 e2             	mov    rdx,rsp
  40106d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  401071:	50                   	push   rax
  401072:	54                   	push   rsp
  401073:	49 c7 c0 c0 12 40 00 	mov    r8,0x4012c0
  40107a:	48 c7 c1 50 12 40 00 	mov    rcx,0x401250
  401081:	48 c7 c7 46 11 40 00 	mov    rdi,0x401146
  401088:	ff 15 62 2f 00 00    	call   QWORD PTR [rip+0x2f62]        # 403ff0 <__libc_start_main@GLIBC_2.2.5>
  40108e:	f4                   	hlt    
  40108f:	90                   	nop

0000000000401090 <_dl_relocate_static_pie>:
  401090:	f3 0f 1e fa          	endbr64 
  401094:	c3                   	ret    
  401095:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40109c:	00 00 00 
  40109f:	90                   	nop

00000000004010a0 <deregister_tm_clones>:
  4010a0:	b8 40 40 40 00       	mov    eax,0x404040
  4010a5:	48 3d 40 40 40 00    	cmp    rax,0x404040
  4010ab:	74 13                	je     4010c0 <deregister_tm_clones+0x20>
  4010ad:	b8 00 00 00 00       	mov    eax,0x0
  4010b2:	48 85 c0             	test   rax,rax
  4010b5:	74 09                	je     4010c0 <deregister_tm_clones+0x20>
  4010b7:	bf 40 40 40 00       	mov    edi,0x404040
  4010bc:	ff e0                	jmp    rax
  4010be:	66 90                	xchg   ax,ax
  4010c0:	c3                   	ret    
  4010c1:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4010c8:	00 00 00 00 
  4010cc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000004010d0 <register_tm_clones>:
  4010d0:	be 40 40 40 00       	mov    esi,0x404040
  4010d5:	48 81 ee 40 40 40 00 	sub    rsi,0x404040
  4010dc:	48 89 f0             	mov    rax,rsi
  4010df:	48 c1 ee 3f          	shr    rsi,0x3f
  4010e3:	48 c1 f8 03          	sar    rax,0x3
  4010e7:	48 01 c6             	add    rsi,rax
  4010ea:	48 d1 fe             	sar    rsi,1
  4010ed:	74 11                	je     401100 <register_tm_clones+0x30>
  4010ef:	b8 00 00 00 00       	mov    eax,0x0
  4010f4:	48 85 c0             	test   rax,rax
  4010f7:	74 07                	je     401100 <register_tm_clones+0x30>
  4010f9:	bf 40 40 40 00       	mov    edi,0x404040
  4010fe:	ff e0                	jmp    rax
  401100:	c3                   	ret    
  401101:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  401108:	00 00 00 00 
  40110c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401110 <__do_global_dtors_aux>:
  401110:	f3 0f 1e fa          	endbr64 
  401114:	80 3d 25 2f 00 00 00 	cmp    BYTE PTR [rip+0x2f25],0x0        # 404040 <__TMC_END__>
  40111b:	75 13                	jne    401130 <__do_global_dtors_aux+0x20>
  40111d:	55                   	push   rbp
  40111e:	48 89 e5             	mov    rbp,rsp
  401121:	e8 7a ff ff ff       	call   4010a0 <deregister_tm_clones>
  401126:	c6 05 13 2f 00 00 01 	mov    BYTE PTR [rip+0x2f13],0x1        # 404040 <__TMC_END__>
  40112d:	5d                   	pop    rbp
  40112e:	c3                   	ret    
  40112f:	90                   	nop
  401130:	c3                   	ret    
  401131:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  401138:	00 00 00 00 
  40113c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401140 <frame_dummy>:
  401140:	f3 0f 1e fa          	endbr64 
  401144:	eb 8a                	jmp    4010d0 <register_tm_clones>

0000000000401146 <main>:
  401146:	55                   	push   rbp
  401147:	48 89 e5             	mov    rbp,rsp
  40114a:	48 83 ec 30          	sub    rsp,0x30
  40114e:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  401151:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  401155:	bf 08 20 40 00       	mov    edi,0x402008
  40115a:	b8 00 00 00 00       	mov    eax,0x0
  40115f:	e8 dc fe ff ff       	call   401040 <printf@plt>
  401164:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  40116b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  401172:	c6 45 f3 01          	mov    BYTE PTR [rbp-0xd],0x1
  401176:	eb 67                	jmp    4011df <main+0x99>               # WOW JUMP FROM HERE
  401178:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1          # rbp-0xc += 0x1
  40117c:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1          # now comparing with 0x1
  401180:	7e 45                	jle    4011c7 <main+0x81>               # if <= 1 jump
  401182:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]          # eax =  rbp-0x8
  401185:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax         # rbp-0x14 = eax
  401188:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]          # eax = rbp-0x4
  40118b:	48 98                	cdqe                                    # until now only eax was filled, now fill rax also by extending msb of eax Note: eax is the lower half of rax
  40118d:	8b 4c 85 e4          	mov    ecx,DWORD PTR [rbp+rax*4-0x1c]   # ecx = (2 left bit shifted rax) + rbp - 28
  401191:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]          # eax = rbp - 0x4
  401194:	8d 50 01             	lea    edx,[rax+0x1]                    # edx = rax + 0x1
  401197:	89 d0                	mov    eax,edx                          # eax = edx
  401199:	c1 f8 1f             	sar    eax,0x1f                         # shift eax right with the minus sign this will make eax = 0x0 or 0xFFFFFFFFF depending on sign
  40119c:	c1 e8 1f             	shr    eax,0x1f                         # shift eax right until it becomes either 0 or 1; 0 if it was positive else 1
  40119f:	01 c2                	add    edx,eax                          # edx += eax
  4011a1:	83 e2 01             	and    edx,0x1                          # bitwise and with 0x1
  4011a4:	29 c2                	sub    edx,eax                          # edx -= eax
  4011a6:	89 d0                	mov    eax,edx                          # eax = edx
  4011a8:	48 98                	cdqe                                    # extend to rax
  4011aa:	8b 44 85 e4          	mov    eax,DWORD PTR [rbp+rax*4-0x1c]   # eax = (2 left bit shifted rax) + rbp - 28
  4011ae:	29 c1                	sub    ecx,eax                          # ecx = ecx - eax
  4011b0:	89 ca                	mov    edx,ecx                          # edx = ecx
  4011b2:	89 55 f8             	mov    DWORD PTR [rbp-0x8],edx          # rbp-0x8 = edx
  4011b5:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2          # rbp-0xc = 0x2
  4011b9:	7e 0c                	jle    4011c7 <main+0x81>
  4011bb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  4011be:	3b 45 f8             	cmp    eax,DWORD PTR [rbp-0x8]
  4011c1:	74 04                	je     4011c7 <main+0x81>
  4011c3:	c6 45 f3 00          	mov    BYTE PTR [rbp-0xd],0x0
  4011c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]          # eax = rbp-0x4; I think this will put the input in eax
  4011ca:	8d 50 01             	lea    edx,[rax+0x1]                    # wdym? is it the prev element/ difference
  4011cd:	89 d0                	mov    eax,edx                          # eax = edx = 0x1 + [rbp-0x4]; Does not make sense prima facie
  4011cf:	c1 f8 1f             	sar    eax,0x1f
  4011d2:	c1 e8 1f             	shr    eax,0x1f                         # I think eax = 0 or 1 after all this right shifting depending upon msb or sign
  4011d5:	01 c2                	add    edx,eax                          # then add edx to eax
  4011d7:	83 e2 01             	and    edx,0x1                          # bitwise add with 000000..0001 => edx has to be 000000...000x where x = is the is the least significant bit of edx
  4011da:	29 c2                	sub    edx,eax                          # edx = edx - eax
  4011dc:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  4011df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]          # WOW JUMP TO HERE
  4011e2:	48 98                	cdqe                                    # until now only eax was filled, now fill rax also by extending msb of eax Note: eax is the lower half of rax
  4011e4:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]                  # Now this shifts rax left by 2 bits and store in rdx
  4011eb:	00 
  4011ec:	48 8d 45 e4          	lea    rax,[rbp-0x1c]                   # store rbp - 0x1c in rax (seen for the first time)
  4011f0:	48 01 d0             	add    rax,rdx                          # rax += rdx
  4011f3:	48 89 c6             	mov    rsi,rax                          # rsi = rax
  4011f6:	bf 40 20 40 00       	mov    edi,0x402040
  4011fb:	b8 00 00 00 00       	mov    eax,0x0
  401200:	e8 4b fe ff ff       	call   401050 <__isoc99_scanf@plt>
  401205:	83 f8 01             	cmp    eax,0x1                          # if input is success ig
  401208:	0f 84 6a ff ff ff    	je     401178 <main+0x32>               # go to line 401178
  40120e:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  401212:	7f 11                	jg     401225 <main+0xdf>
  401214:	bf 48 20 40 00       	mov    edi,0x402048
  401219:	e8 12 fe ff ff       	call   401030 <puts@plt>
  40121e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  401223:	eb 21                	jmp    401246 <main+0x100>
  401225:	80 7d f3 00          	cmp    BYTE PTR [rbp-0xd],0x0
  401229:	74 0c                	je     401237 <main+0xf1>
  40122b:	bf 77 20 40 00       	mov    edi,0x402077
  401230:	e8 fb fd ff ff       	call   401030 <puts@plt>
  401235:	eb 0a                	jmp    401241 <main+0xfb>
  401237:	bf 7b 20 40 00       	mov    edi,0x40207b
  40123c:	e8 ef fd ff ff       	call   401030 <puts@plt>
  401241:	b8 00 00 00 00       	mov    eax,0x0
  401246:	c9                   	leave  
  401247:	c3                   	ret    
  401248:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40124f:	00 

0000000000401250 <__libc_csu_init>:
  401250:	f3 0f 1e fa          	endbr64 
  401254:	41 57                	push   r15
  401256:	4c 8d 3d a3 2b 00 00 	lea    r15,[rip+0x2ba3]        # 403e00 <__frame_dummy_init_array_entry>
  40125d:	41 56                	push   r14
  40125f:	49 89 d6             	mov    r14,rdx
  401262:	41 55                	push   r13
  401264:	49 89 f5             	mov    r13,rsi
  401267:	41 54                	push   r12
  401269:	41 89 fc             	mov    r12d,edi
  40126c:	55                   	push   rbp
  40126d:	48 8d 2d 94 2b 00 00 	lea    rbp,[rip+0x2b94]        # 403e08 <__do_global_dtors_aux_fini_array_entry>
  401274:	53                   	push   rbx
  401275:	4c 29 fd             	sub    rbp,r15
  401278:	48 83 ec 08          	sub    rsp,0x8
  40127c:	e8 7f fd ff ff       	call   401000 <_init>
  401281:	48 c1 fd 03          	sar    rbp,0x3
  401285:	74 1f                	je     4012a6 <__libc_csu_init+0x56>
  401287:	31 db                	xor    ebx,ebx
  401289:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401290:	4c 89 f2             	mov    rdx,r14
  401293:	4c 89 ee             	mov    rsi,r13
  401296:	44 89 e7             	mov    edi,r12d
  401299:	41 ff 14 df          	call   QWORD PTR [r15+rbx*8]
  40129d:	48 83 c3 01          	add    rbx,0x1
  4012a1:	48 39 dd             	cmp    rbp,rbx
  4012a4:	75 ea                	jne    401290 <__libc_csu_init+0x40>
  4012a6:	48 83 c4 08          	add    rsp,0x8
  4012aa:	5b                   	pop    rbx
  4012ab:	5d                   	pop    rbp
  4012ac:	41 5c                	pop    r12
  4012ae:	41 5d                	pop    r13
  4012b0:	41 5e                	pop    r14
  4012b2:	41 5f                	pop    r15
  4012b4:	c3                   	ret    
  4012b5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4012bc:	00 00 00 00 

00000000004012c0 <__libc_csu_fini>:
  4012c0:	f3 0f 1e fa          	endbr64 
  4012c4:	c3                   	ret    

Disassembly of section .fini:

00000000004012c8 <_fini>:
  4012c8:	f3 0f 1e fa          	endbr64 
  4012cc:	48 83 ec 08          	sub    rsp,0x8
  4012d0:	48 83 c4 08          	add    rsp,0x8
  4012d4:	c3                   	ret    

Disassembly of section .rodata:

0000000000402000 <_IO_stdin_used>:
  402000:	01 00                	add    DWORD PTR [rax],eax
  402002:	02 00                	add    al,BYTE PTR [rax]
  402004:	00 00                	add    BYTE PTR [rax],al
  402006:	00 00                	add    BYTE PTR [rax],al
  402008:	45 6e                	rex.RB outs dx,BYTE PTR ds:[rsi]
  40200a:	74 65                	je     402071 <_IO_stdin_used+0x71>
  40200c:	72 20                	jb     40202e <_IO_stdin_used+0x2e>
  40200e:	74 68                	je     402078 <_IO_stdin_used+0x78>
  402010:	72 65                	jb     402077 <_IO_stdin_used+0x77>
  402012:	65 20 6f 72          	and    BYTE PTR gs:[rdi+0x72],ch
  402016:	20 6d 6f             	and    BYTE PTR [rbp+0x6f],ch
  402019:	72 65                	jb     402080 <__GNU_EH_FRAME_HDR>
  40201b:	20 6e 75             	and    BYTE PTR [rsi+0x75],ch
  40201e:	6d                   	ins    DWORD PTR es:[rdi],dx
  40201f:	62 65                	(bad)  
  402021:	72 73                	jb     402096 <__GNU_EH_FRAME_HDR+0x16>
  402023:	20 28                	and    BYTE PTR [rax],ch
  402025:	54                   	push   rsp
  402026:	65 72 6d             	gs jb  402096 <__GNU_EH_FRAME_HDR+0x16>
  402029:	69 6e 61 74 65 20 77 	imul   ebp,DWORD PTR [rsi+0x61],0x77206574
  402030:	69 74 68 20 43 54 52 	imul   esi,DWORD PTR [rax+rbp*2+0x20],0x4c525443
  402037:	4c 
  402038:	20 2b                	and    BYTE PTR [rbx],ch
  40203a:	20 44 29 3a          	and    BYTE PTR [rcx+rbp*1+0x3a],al
  40203e:	20 00                	and    BYTE PTR [rax],al
  402040:	25 64 00 00 00       	and    eax,0x64
  402045:	00 00                	add    BYTE PTR [rax],al
  402047:	00 59 6f             	add    BYTE PTR [rcx+0x6f],bl
  40204a:	75 20                	jne    40206c <_IO_stdin_used+0x6c>
  40204c:	68 61 76 65 20       	push   0x20657661
  402051:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  402052:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  402053:	74 20                	je     402075 <_IO_stdin_used+0x75>
  402055:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
  402057:	74 65                	je     4020be <__GNU_EH_FRAME_HDR+0x3e>
  402059:	72 65                	jb     4020c0 <__GNU_EH_FRAME_HDR+0x40>
  40205b:	64 20 65 6e          	and    BYTE PTR fs:[rbp+0x6e],ah
  40205f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  402060:	75 67                	jne    4020c9 <__GNU_EH_FRAME_HDR+0x49>
  402062:	68 20 6e 75 6d       	push   0x6d756e20
  402067:	62 65                	(bad)  
  402069:	72 73                	jb     4020de <__GNU_EH_FRAME_HDR+0x5e>
  40206b:	2c 20                	sub    al,0x20
  40206d:	74 72                	je     4020e1 <__GNU_EH_FRAME_HDR+0x61>
  40206f:	79 20                	jns    402091 <__GNU_EH_FRAME_HDR+0x11>
  402071:	61                   	(bad)  
  402072:	67 61                	addr32 (bad) 
  402074:	69 6e 00 59 45 53 00 	imul   ebp,DWORD PTR [rsi+0x0],0x534559
  40207b:	4e                   	rex.WRX
  40207c:	4f                   	rex.WRXB
	...

Disassembly of section .eh_frame_hdr:

0000000000402080 <__GNU_EH_FRAME_HDR>:
  402080:	01 1b                	add    DWORD PTR [rbx],ebx
  402082:	03 3b                	add    edi,DWORD PTR [rbx]
  402084:	3c 00                	cmp    al,0x0
  402086:	00 00                	add    BYTE PTR [rax],al
  402088:	06                   	(bad)  
  402089:	00 00                	add    BYTE PTR [rax],al
  40208b:	00 a0 ef ff ff 80    	add    BYTE PTR [rax-0x7f000011],ah
  402091:	00 00                	add    BYTE PTR [rax],al
  402093:	00 e0                	add    al,ah
  402095:	ef                   	out    dx,eax
  402096:	ff                   	(bad)  
  402097:	ff 58 00             	call   FWORD PTR [rax+0x0]
  40209a:	00 00                	add    BYTE PTR [rax],al
  40209c:	10 f0                	adc    al,dh
  40209e:	ff                   	(bad)  
  40209f:	ff 6c 00 00          	jmp    FWORD PTR [rax+rax*1+0x0]
  4020a3:	00 c6                	add    dh,al
  4020a5:	f0 ff                	lock (bad) 
  4020a7:	ff a8 00 00 00 d0    	jmp    FWORD PTR [rax-0x30000000]
  4020ad:	f1                   	int1   
  4020ae:	ff                   	(bad)  
  4020af:	ff c8                	dec    eax
  4020b1:	00 00                	add    BYTE PTR [rax],al
  4020b3:	00 40 f2             	add    BYTE PTR [rax-0xe],al
  4020b6:	ff                   	(bad)  
  4020b7:	ff 10                	call   QWORD PTR [rax]
  4020b9:	01 00                	add    DWORD PTR [rax],eax
	...

Disassembly of section .eh_frame:

00000000004020c0 <__FRAME_END__-0xe4>:
  4020c0:	14 00                	adc    al,0x0
  4020c2:	00 00                	add    BYTE PTR [rax],al
  4020c4:	00 00                	add    BYTE PTR [rax],al
  4020c6:	00 00                	add    BYTE PTR [rax],al
  4020c8:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
  4020cb:	00 01                	add    BYTE PTR [rcx],al
  4020cd:	78 10                	js     4020df <__GNU_EH_FRAME_HDR+0x5f>
  4020cf:	01 1b                	add    DWORD PTR [rbx],ebx
  4020d1:	0c 07                	or     al,0x7
  4020d3:	08 90 01 00 00 10    	or     BYTE PTR [rax+0x10000001],dl
  4020d9:	00 00                	add    BYTE PTR [rax],al
  4020db:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
  4020de:	00 00                	add    BYTE PTR [rax],al
  4020e0:	80 ef ff             	sub    bh,0xff
  4020e3:	ff 2f                	jmp    FWORD PTR [rdi]
  4020e5:	00 00                	add    BYTE PTR [rax],al
  4020e7:	00 00                	add    BYTE PTR [rax],al
  4020e9:	44 07                	rex.R (bad) 
  4020eb:	10 10                	adc    BYTE PTR [rax],dl
  4020ed:	00 00                	add    BYTE PTR [rax],al
  4020ef:	00 30                	add    BYTE PTR [rax],dh
  4020f1:	00 00                	add    BYTE PTR [rax],al
  4020f3:	00 9c ef ff ff 05 00 	add    BYTE PTR [rdi+rbp*8+0x5ffff],bl
  4020fa:	00 00                	add    BYTE PTR [rax],al
  4020fc:	00 00                	add    BYTE PTR [rax],al
  4020fe:	00 00                	add    BYTE PTR [rax],al
  402100:	24 00                	and    al,0x0
  402102:	00 00                	add    BYTE PTR [rax],al
  402104:	44 00 00             	add    BYTE PTR [rax],r8b
  402107:	00 18                	add    BYTE PTR [rax],bl
  402109:	ef                   	out    dx,eax
  40210a:	ff                   	(bad)  
  40210b:	ff 40 00             	inc    DWORD PTR [rax+0x0]
  40210e:	00 00                	add    BYTE PTR [rax],al
  402110:	00 0e                	add    BYTE PTR [rsi],cl
  402112:	10 46 0e             	adc    BYTE PTR [rsi+0xe],al
  402115:	18 4a 0f             	sbb    BYTE PTR [rdx+0xf],cl
  402118:	0b 77 08             	or     esi,DWORD PTR [rdi+0x8]
  40211b:	80 00 3f             	add    BYTE PTR [rax],0x3f
  40211e:	1a 3b                	sbb    bh,BYTE PTR [rbx]
  402120:	2a 33                	sub    dh,BYTE PTR [rbx]
  402122:	24 22                	and    al,0x22
  402124:	00 00                	add    BYTE PTR [rax],al
  402126:	00 00                	add    BYTE PTR [rax],al
  402128:	1c 00                	sbb    al,0x0
  40212a:	00 00                	add    BYTE PTR [rax],al
  40212c:	6c                   	ins    BYTE PTR es:[rdi],dx
  40212d:	00 00                	add    BYTE PTR [rax],al
  40212f:	00 16                	add    BYTE PTR [rsi],dl
  402131:	f0 ff                	lock (bad) 
  402133:	ff 02                	inc    DWORD PTR [rdx]
  402135:	01 00                	add    DWORD PTR [rax],eax
  402137:	00 00                	add    BYTE PTR [rax],al
  402139:	41 0e                	rex.B (bad) 
  40213b:	10 86 02 43 0d 06    	adc    BYTE PTR [rsi+0x60d4302],al
  402141:	02 fd                	add    bh,ch
  402143:	0c 07                	or     al,0x7
  402145:	08 00                	or     BYTE PTR [rax],al
  402147:	00 44 00 00          	add    BYTE PTR [rax+rax*1+0x0],al
  40214b:	00 8c 00 00 00 00 f1 	add    BYTE PTR [rax+rax*1-0xf000000],cl
  402152:	ff                   	(bad)  
  402153:	ff 65 00             	jmp    QWORD PTR [rbp+0x0]
  402156:	00 00                	add    BYTE PTR [rax],al
  402158:	00 46 0e             	add    BYTE PTR [rsi+0xe],al
  40215b:	10 8f 02 49 0e 18    	adc    BYTE PTR [rdi+0x180e4902],cl
  402161:	8e 03                	mov    es,WORD PTR [rbx]
  402163:	45 0e                	rex.RB (bad) 
  402165:	20 8d 04 45 0e 28    	and    BYTE PTR [rbp+0x280e4504],cl
  40216b:	8c 05 44 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e44],es        # ffffffff86702fb5 <_end+0xffffffff862fef6d>
  402171:	06                   	(bad)  
  402172:	48 0e                	rex.W (bad) 
  402174:	38 83 07 47 0e 40    	cmp    BYTE PTR [rbx+0x400e4707],al
  40217a:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  40217b:	0e                   	(bad)  
  40217c:	38 41 0e             	cmp    BYTE PTR [rcx+0xe],al
  40217f:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
  402182:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
  402185:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
  402188:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
  40218b:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
  40218e:	08 00                	or     BYTE PTR [rax],al
  402190:	10 00                	adc    BYTE PTR [rax],al
  402192:	00 00                	add    BYTE PTR [rax],al
  402194:	d4                   	(bad)  
  402195:	00 00                	add    BYTE PTR [rax],al
  402197:	00 28                	add    BYTE PTR [rax],ch
  402199:	f1                   	int1   
  40219a:	ff                   	(bad)  
  40219b:	ff 05 00 00 00 00    	inc    DWORD PTR [rip+0x0]        # 4021a1 <__GNU_EH_FRAME_HDR+0x121>
  4021a1:	00 00                	add    BYTE PTR [rax],al
	...

00000000004021a4 <__FRAME_END__>:
  4021a4:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .init_array:

0000000000403e00 <__frame_dummy_init_array_entry>:
  403e00:	40 11 40 00          	rex adc DWORD PTR [rax+0x0],eax
  403e04:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .fini_array:

0000000000403e08 <__do_global_dtors_aux_fini_array_entry>:
  403e08:	10 11                	adc    BYTE PTR [rcx],dl
  403e0a:	40 00 00             	rex add BYTE PTR [rax],al
  403e0d:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .dynamic:

0000000000403e10 <_DYNAMIC>:
  403e10:	01 00                	add    DWORD PTR [rax],eax
  403e12:	00 00                	add    BYTE PTR [rax],al
  403e14:	00 00                	add    BYTE PTR [rax],al
  403e16:	00 00                	add    BYTE PTR [rax],al
  403e18:	01 00                	add    DWORD PTR [rax],eax
  403e1a:	00 00                	add    BYTE PTR [rax],al
  403e1c:	00 00                	add    BYTE PTR [rax],al
  403e1e:	00 00                	add    BYTE PTR [rax],al
  403e20:	0c 00                	or     al,0x0
  403e22:	00 00                	add    BYTE PTR [rax],al
  403e24:	00 00                	add    BYTE PTR [rax],al
  403e26:	00 00                	add    BYTE PTR [rax],al
  403e28:	00 10                	add    BYTE PTR [rax],dl
  403e2a:	40 00 00             	rex add BYTE PTR [rax],al
  403e2d:	00 00                	add    BYTE PTR [rax],al
  403e2f:	00 0d 00 00 00 00    	add    BYTE PTR [rip+0x0],cl        # 403e35 <_DYNAMIC+0x25>
  403e35:	00 00                	add    BYTE PTR [rax],al
  403e37:	00 c8                	add    al,cl
  403e39:	12 40 00             	adc    al,BYTE PTR [rax+0x0]
  403e3c:	00 00                	add    BYTE PTR [rax],al
  403e3e:	00 00                	add    BYTE PTR [rax],al
  403e40:	19 00                	sbb    DWORD PTR [rax],eax
  403e42:	00 00                	add    BYTE PTR [rax],al
  403e44:	00 00                	add    BYTE PTR [rax],al
  403e46:	00 00                	add    BYTE PTR [rax],al
  403e48:	00 3e                	add    BYTE PTR [rsi],bh
  403e4a:	40 00 00             	rex add BYTE PTR [rax],al
  403e4d:	00 00                	add    BYTE PTR [rax],al
  403e4f:	00 1b                	add    BYTE PTR [rbx],bl
  403e51:	00 00                	add    BYTE PTR [rax],al
  403e53:	00 00                	add    BYTE PTR [rax],al
  403e55:	00 00                	add    BYTE PTR [rax],al
  403e57:	00 08                	add    BYTE PTR [rax],cl
  403e59:	00 00                	add    BYTE PTR [rax],al
  403e5b:	00 00                	add    BYTE PTR [rax],al
  403e5d:	00 00                	add    BYTE PTR [rax],al
  403e5f:	00 1a                	add    BYTE PTR [rdx],bl
  403e61:	00 00                	add    BYTE PTR [rax],al
  403e63:	00 00                	add    BYTE PTR [rax],al
  403e65:	00 00                	add    BYTE PTR [rax],al
  403e67:	00 08                	add    BYTE PTR [rax],cl
  403e69:	3e 40 00 00          	ds rex add BYTE PTR [rax],al
  403e6d:	00 00                	add    BYTE PTR [rax],al
  403e6f:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
  403e72:	00 00                	add    BYTE PTR [rax],al
  403e74:	00 00                	add    BYTE PTR [rax],al
  403e76:	00 00                	add    BYTE PTR [rax],al
  403e78:	08 00                	or     BYTE PTR [rax],al
  403e7a:	00 00                	add    BYTE PTR [rax],al
  403e7c:	00 00                	add    BYTE PTR [rax],al
  403e7e:	00 00                	add    BYTE PTR [rax],al
  403e80:	04 00                	add    al,0x0
  403e82:	00 00                	add    BYTE PTR [rax],al
  403e84:	00 00                	add    BYTE PTR [rax],al
  403e86:	00 00                	add    BYTE PTR [rax],al
  403e88:	e8 02 40 00 00       	call   407e8f <_end+0x3e47>
  403e8d:	00 00                	add    BYTE PTR [rax],al
  403e8f:	00 f5                	add    ch,dh
  403e91:	fe                   	(bad)  
  403e92:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
  403e95:	00 00                	add    BYTE PTR [rax],al
  403e97:	00 18                	add    BYTE PTR [rax],bl
  403e99:	03 40 00             	add    eax,DWORD PTR [rax+0x0]
  403e9c:	00 00                	add    BYTE PTR [rax],al
  403e9e:	00 00                	add    BYTE PTR [rax],al
  403ea0:	05 00 00 00 00       	add    eax,0x0
  403ea5:	00 00                	add    BYTE PTR [rax],al
  403ea7:	00 c8                	add    al,cl
  403ea9:	03 40 00             	add    eax,DWORD PTR [rax+0x0]
  403eac:	00 00                	add    BYTE PTR [rax],al
  403eae:	00 00                	add    BYTE PTR [rax],al
  403eb0:	06                   	(bad)  
  403eb1:	00 00                	add    BYTE PTR [rax],al
  403eb3:	00 00                	add    BYTE PTR [rax],al
  403eb5:	00 00                	add    BYTE PTR [rax],al
  403eb7:	00 38                	add    BYTE PTR [rax],bh
  403eb9:	03 40 00             	add    eax,DWORD PTR [rax+0x0]
  403ebc:	00 00                	add    BYTE PTR [rax],al
  403ebe:	00 00                	add    BYTE PTR [rax],al
  403ec0:	0a 00                	or     al,BYTE PTR [rax]
  403ec2:	00 00                	add    BYTE PTR [rax],al
  403ec4:	00 00                	add    BYTE PTR [rax],al
  403ec6:	00 00                	add    BYTE PTR [rax],al
  403ec8:	5d                   	pop    rbp
  403ec9:	00 00                	add    BYTE PTR [rax],al
  403ecb:	00 00                	add    BYTE PTR [rax],al
  403ecd:	00 00                	add    BYTE PTR [rax],al
  403ecf:	00 0b                	add    BYTE PTR [rbx],cl
  403ed1:	00 00                	add    BYTE PTR [rax],al
  403ed3:	00 00                	add    BYTE PTR [rax],al
  403ed5:	00 00                	add    BYTE PTR [rax],al
  403ed7:	00 18                	add    BYTE PTR [rax],bl
  403ed9:	00 00                	add    BYTE PTR [rax],al
  403edb:	00 00                	add    BYTE PTR [rax],al
  403edd:	00 00                	add    BYTE PTR [rax],al
  403edf:	00 15 00 00 00 00    	add    BYTE PTR [rip+0x0],dl        # 403ee5 <_DYNAMIC+0xd5>
	...
  403eed:	00 00                	add    BYTE PTR [rax],al
  403eef:	00 03                	add    BYTE PTR [rbx],al
	...
  403ef9:	40                   	rex
  403efa:	40 00 00             	rex add BYTE PTR [rax],al
  403efd:	00 00                	add    BYTE PTR [rax],al
  403eff:	00 02                	add    BYTE PTR [rdx],al
  403f01:	00 00                	add    BYTE PTR [rax],al
  403f03:	00 00                	add    BYTE PTR [rax],al
  403f05:	00 00                	add    BYTE PTR [rax],al
  403f07:	00 48 00             	add    BYTE PTR [rax+0x0],cl
  403f0a:	00 00                	add    BYTE PTR [rax],al
  403f0c:	00 00                	add    BYTE PTR [rax],al
  403f0e:	00 00                	add    BYTE PTR [rax],al
  403f10:	14 00                	adc    al,0x0
  403f12:	00 00                	add    BYTE PTR [rax],al
  403f14:	00 00                	add    BYTE PTR [rax],al
  403f16:	00 00                	add    BYTE PTR [rax],al
  403f18:	07                   	(bad)  
  403f19:	00 00                	add    BYTE PTR [rax],al
  403f1b:	00 00                	add    BYTE PTR [rax],al
  403f1d:	00 00                	add    BYTE PTR [rax],al
  403f1f:	00 17                	add    BYTE PTR [rdi],dl
  403f21:	00 00                	add    BYTE PTR [rax],al
  403f23:	00 00                	add    BYTE PTR [rax],al
  403f25:	00 00                	add    BYTE PTR [rax],al
  403f27:	00 98 04 40 00 00    	add    BYTE PTR [rax+0x4004],bl
  403f2d:	00 00                	add    BYTE PTR [rax],al
  403f2f:	00 07                	add    BYTE PTR [rdi],al
  403f31:	00 00                	add    BYTE PTR [rax],al
  403f33:	00 00                	add    BYTE PTR [rax],al
  403f35:	00 00                	add    BYTE PTR [rax],al
  403f37:	00 68 04             	add    BYTE PTR [rax+0x4],ch
  403f3a:	40 00 00             	rex add BYTE PTR [rax],al
  403f3d:	00 00                	add    BYTE PTR [rax],al
  403f3f:	00 08                	add    BYTE PTR [rax],cl
  403f41:	00 00                	add    BYTE PTR [rax],al
  403f43:	00 00                	add    BYTE PTR [rax],al
  403f45:	00 00                	add    BYTE PTR [rax],al
  403f47:	00 30                	add    BYTE PTR [rax],dh
  403f49:	00 00                	add    BYTE PTR [rax],al
  403f4b:	00 00                	add    BYTE PTR [rax],al
  403f4d:	00 00                	add    BYTE PTR [rax],al
  403f4f:	00 09                	add    BYTE PTR [rcx],cl
  403f51:	00 00                	add    BYTE PTR [rax],al
  403f53:	00 00                	add    BYTE PTR [rax],al
  403f55:	00 00                	add    BYTE PTR [rax],al
  403f57:	00 18                	add    BYTE PTR [rax],bl
  403f59:	00 00                	add    BYTE PTR [rax],al
  403f5b:	00 00                	add    BYTE PTR [rax],al
  403f5d:	00 00                	add    BYTE PTR [rax],al
  403f5f:	00 fe                	add    dh,bh
  403f61:	ff                   	(bad)  
  403f62:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
  403f65:	00 00                	add    BYTE PTR [rax],al
  403f67:	00 38                	add    BYTE PTR [rax],bh
  403f69:	04 40                	add    al,0x40
  403f6b:	00 00                	add    BYTE PTR [rax],al
  403f6d:	00 00                	add    BYTE PTR [rax],al
  403f6f:	00 ff                	add    bh,bh
  403f71:	ff                   	(bad)  
  403f72:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
  403f75:	00 00                	add    BYTE PTR [rax],al
  403f77:	00 01                	add    BYTE PTR [rcx],al
  403f79:	00 00                	add    BYTE PTR [rax],al
  403f7b:	00 00                	add    BYTE PTR [rax],al
  403f7d:	00 00                	add    BYTE PTR [rax],al
  403f7f:	00 f0                	add    al,dh
  403f81:	ff                   	(bad)  
  403f82:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
  403f85:	00 00                	add    BYTE PTR [rax],al
  403f87:	00 26                	add    BYTE PTR [rsi],ah
  403f89:	04 40                	add    al,0x40
	...

Disassembly of section .got:

0000000000403ff0 <.got>:
	...

Disassembly of section .got.plt:

0000000000404000 <_GLOBAL_OFFSET_TABLE_>:
  404000:	10 3e                	adc    BYTE PTR [rsi],bh
  404002:	40 00 00             	rex add BYTE PTR [rax],al
	...
  404015:	00 00                	add    BYTE PTR [rax],al
  404017:	00 36                	add    BYTE PTR [rsi],dh
  404019:	10 40 00             	adc    BYTE PTR [rax+0x0],al
  40401c:	00 00                	add    BYTE PTR [rax],al
  40401e:	00 00                	add    BYTE PTR [rax],al
  404020:	46 10 40 00          	rex.RX adc BYTE PTR [rax+0x0],r8b
  404024:	00 00                	add    BYTE PTR [rax],al
  404026:	00 00                	add    BYTE PTR [rax],al
  404028:	56                   	push   rsi
  404029:	10 40 00             	adc    BYTE PTR [rax+0x0],al
  40402c:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .data:

0000000000404030 <__data_start>:
	...

0000000000404038 <__dso_handle>:
	...

Disassembly of section .bss:

0000000000404040 <completed.0>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp spl,BYTE PTR [r8]
   5:	28 47 4e             	sub    BYTE PTR [rdi+0x4e],al
   8:	55                   	push   rbp
   9:	29 20                	sub    DWORD PTR [rax],esp
   b:	31 33                	xor    DWORD PTR [rbx],esi
   d:	2e 31 2e             	cs xor DWORD PTR [rsi],ebp
  10:	30 00                	xor    BYTE PTR [rax],al
