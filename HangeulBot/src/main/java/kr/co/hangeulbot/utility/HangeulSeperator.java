package kr.co.hangeulbot.utility;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import kr.co.hangeulbot.model.vo.HangeulbotPhonicsFinalLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsInitialLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsVowelLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordLogVO;

@Component
public class HangeulSeperator {
	private static final char[] CHO = 
		/*ㄱ ㄲ ㄴ ㄷ ㄸ ㄹ ㅁ ㅂ ㅃ ㅅ ㅆ ㅇ ㅈ ㅉ ㅊ ㅋ ㅌ ㅍ ㅎ */
	{0x3131, 0x3132, 0x3134, 0x3137, 0x3138, 0x3139, 0x3141, 0x3142, 0x3143, 0x3145,
		0x3146, 0x3147, 0x3148, 0x3149, 0x314a, 0x314b, 0x314c, 0x314d, 0x314e};
	private static final char[] JUN = 
		/*ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ*/
	{0x314f, 0x3150, 0x3151, 0x3152, 0x3153, 0x3154, 0x3155, 0x3156, 0x3157, 0x3158,
		0x3159, 0x315a, 0x315b, 0x315c, 0x315d, 0x315e, 0x315f, 0x3160,	0x3161,	0x3162,
		0x3163};
		/*ㄱㄲㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅆㅇㅈㅊㅋㅌㅍㅎ*/
	private static final char[] JON = 
	{0x0000, 0x3131, 0x3132, 0x3133, 0x3134, 0x3135, 0x3136, 0x3137, 0x3139, 0x313a,
		0x313b, 0x313c, 0x313d, 0x313e, 0x313f, 0x3140, 0x3141, 0x3142, 0x3144, 0x3145,
		0x3146, 0x3147, 0x3148, 0x314a, 0x314b, 0x314c, 0x314d, 0x314e};

	

	public Integer[] hangeulSeperating(char usersAnswer) {
		
		Integer [] charList = new Integer[3];
			if(usersAnswer >= 0xAC00)
			{
				char uniVal = (char) (usersAnswer - 0xAC00);
				
				char cho = (char) (((uniVal - (uniVal % 28))/28)/21);
				char jun = (char) (((uniVal - (uniVal % 28))/28)%21);
				char jon = (char) (uniVal %28);
				

				System.out.println(""+usersAnswer+"// 0x" + Integer.toHexString((char) usersAnswer));
				System.out.println(""+ CHO[cho]+"// 0x" + Integer.toHexString((char) cho) );
				System.out.println(""+ JUN[jun]+"// 0x" + Integer.toHexString((char) jun) );
				
				charList[0] = (int)cho;
				charList[1] = (int)jun;
				
				if((char)jon != 0x0000){
					System.out.println(""+ JON[jon]+"// 0x" + Integer.toHexString((char) jon) );
					charList[2] = (int)jon;
				}else{
					charList[2] = -1;
				}
				
				
			}
		return charList;
	}
}
