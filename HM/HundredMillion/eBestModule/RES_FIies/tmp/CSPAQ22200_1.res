BEGIN_FUNCTION_MAP
	.Func,�������¿����� �ֹ����ɱݾ� ����2,CSPAQ22200,SERVICE=CSPAQ22200,headtype=B,CREATOR=�ۿ켮,CREDATE=2020/02/25 08:21:10;
	BEGIN_DATA_MAP
	CSPAQ22200InBlock1,In(*EMPTY*),input;
	begin
		���ڵ尹��, RecCnt, RecCnt, long, 5
		����������ȣ, MgmtBrnNo, MgmtBrnNo, char, 3;
		���¹�ȣ, AcntNo, AcntNo, char, 20;
		��й�ȣ, Pwd, Pwd, char, 8;
		�ܰ���������, BalCreTp, BalCreTp, char, 1;
	end
	CSPAQ22200OutBlock1,In(*EMPTY*),output;
	begin
		���ڵ尹��, RecCnt, RecCnt, long, 5
		����������ȣ, MgmtBrnNo, MgmtBrnNo, char, 3;
		���¹�ȣ, AcntNo, AcntNo, char, 20;
		��й�ȣ, Pwd, Pwd, char, 8;
		�ܰ���������, BalCreTp, BalCreTp, char, 1;
	end
	CSPAQ22200OutBlock2,Out(*EMPTY*),output;
	begin
		���ڵ尹��, RecCnt, RecCnt, long, 5
		������, BrnNm, BrnNm, char, 40;
		���¸�, AcntNm, AcntNm, char, 40;
		�����ֹ����ɱݾ�, MnyOrdAbleAmt, MnyOrdAbleAmt, long, 16;
		����ֹ����ɱݾ�, SubstOrdAbleAmt, SubstOrdAbleAmt, long, 16;
		�ŷ��ұݾ�, SeOrdAbleAmt, SeOrdAbleAmt, long, 16;
		�ڽ��ڱݾ�, KdqOrdAbleAmt, KdqOrdAbleAmt, long, 16;
		�ſ�㺸�ֹ��ݾ�, CrdtPldgOrdAmt, CrdtPldgOrdAmt, long, 16;
		���űݷ�100�ۼ�Ʈ�ֹ����ɱݾ�, MgnRat100pctOrdAbleAmt, MgnRat100pctOrdAbleAmt, long, 16;
		���űݷ�35%�ֹ����ɱݾ�, MgnRat35ordAbleAmt, MgnRat35ordAbleAmt, long, 16;
		���űݷ�50%�ֹ����ɱݾ�, MgnRat50ordAbleAmt, MgnRat50ordAbleAmt, long, 16;
		�ſ��ֹ����ɱݾ�, CrdtOrdAbleAmt, CrdtOrdAbleAmt, long, 16;
		������, Dps, Dps, long, 16;
		���ݾ�, SubstAmt, SubstAmt, long, 16;
		���ű�����, MgnMny, MgnMny, long, 16;
		���űݴ��, MgnSubst, MgnSubst, long, 16;
		D1������, D1Dps, D1Dps, long, 16;
		D2������, D2Dps, D2Dps, long, 16;
		�̼��ݾ�, RcvblAmt, RcvblAmt, long, 16;
		D1��ü�����ҿ�ݾ�, D1ovdRepayRqrdAmt, D1ovdRepayRqrdAmt, long, 16;
		D2��ü�����ҿ�ݾ�, D2ovdRepayRqrdAmt, D2ovdRepayRqrdAmt, long, 16;
		���ڱݾ�, MloanAmt, MloanAmt, long, 16;
		�����Ĵ㺸����, ChgAfPldgRat, ChgAfPldgRat, double, 9.3;
		�ҿ�㺸�ݾ�, RqrdPldgAmt, RqrdPldgAmt, long, 16;
		�㺸�����ݾ�, PdlckAmt, PdlckAmt, long, 16;
		���㺸�հ�ݾ�, OrgPldgSumAmt, OrgPldgSumAmt, long, 16;
		�δ㺸�հ�ݾ�, SubPldgSumAmt, SubPldgSumAmt, long, 16;
		�ſ�㺸������, CrdtPldgAmtMny, CrdtPldgAmtMny, long, 16;
		�ſ�㺸���ݾ�, CrdtPldgSubstAmt, CrdtPldgSubstAmt, long, 16;
		�ſ뼳��������, Imreq, Imreq, long, 16;
		�ſ�㺸����ݾ�, CrdtPldgRuseAmt, CrdtPldgRuseAmt, long, 16;
		ó�����ѱݾ�, DpslRestrcAmt, DpslRestrcAmt, long, 16;
		���ϸŵ�����ݾ�, PrdaySellAdjstAmt, PrdaySellAdjstAmt, long, 16;
		���ϸż�����ݾ�, PrdayBuyAdjstAmt, PrdayBuyAdjstAmt, long, 16;
		���ϸŵ�����ݾ�, CrdaySellAdjstAmt, CrdaySellAdjstAmt, long, 16;
		���ϸż�����ݾ�, CrdayBuyAdjstAmt, CrdayBuyAdjstAmt, long, 16;
		�ŵ���ݴ㺸����ݾ�, CslLoanAmtdt1, CslLoanAmtdt1, long, 16;
	end
	END_DATA_MAP
END_FUNCTION_MAP