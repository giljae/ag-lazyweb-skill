# 안티그래비티 레이지웹 스킬 (Antigravity Lazyweb Skill)

**감(Vibe)이 아닌 근거(Evidence)로 디자인하세요.**

이 프로젝트는 오리지널 [lazyweb-skill](https://github.com/aboul3ata/lazyweb-skill)을 **안티그래비티(Antigravity)** 환경에 최적화하여 포팅한 버전입니다. 레이지웹의 방대한 스크린샷 데이터베이스를 활용하여 안티그래비티가 심층적인 디자인 리서치, 시각적 영감 수집, 디자인 비평 등을 수행할 수 있게 해줍니다.

## 🚀 안티그래비티 전용 주요 특징

- **네이티브 브라우저 통합**: 안티그래비티 전용 `browser_subagent`를 사용하여 실시간 웹 사이트를 고화질로 캡처합니다.
- **인터랙티브 아티팩트**: 리서치 보고서를 안티그래비티 전용 **Artifacts**로 생성하여, 세련된 레이아웃에서 즉시 미리보기가 가능합니다.
- **최적화된 워크플로우**: 안티그래비티의 도구셋과 추론 능력에 최적화된 `SKILL.md` 지침을 제공합니다.

## 🛠 사용 가능한 스킬

### 🔍 핵심 디자인 도구
- **`/lazyweb-design-research`**: **심층 디자인 리서치**. 
  경쟁사를 식별하고, 레이지웹 데이터베이스와 실시간 웹을 모두 검색하여 시각적 레퍼런스를 수집합니다. TL;DR, 사례 분석, 주요 발견점, 디자인 패턴, 안티 패턴, 독특한 관점 및 구체적인 추천안이 포함된 구조화된 리포트를 생성합니다. 경쟁사 분석 및 베스트 프랙티스 조사에 적합합니다.
- **`/lazyweb-quick-references`**: **시각적 영감 수집**. 
  레이지웹을 빠르게 검색하고 결과를 디자인 패턴별로 그룹화하여 보여줍니다. 전체적인 분석보다는 특정 UI 패턴(예: "SaaS 가격 페이지")의 시각적 참고 자료가 빠르게 필요할 때 사용합니다.
- **`/lazyweb-design-improve`**: **디자인 비평 및 개선**. 
  현재 디자인의 스크린샷을 캡처하고, 업계 최고 수준의 앱들에서 유사한 화면을 찾아 1~5개의 구체적인 개선 아이디어를 제안합니다. 각 제안은 실제 시각적 레퍼런스와 연결되어 제공됩니다.
- **`/lazyweb-design-brainstorm`**: **창의적 아이디어 브레인스토밍**. 
  의도적으로 사용자의 제품 카테고리 *외부*에서 새로운 패턴을 검색합니다. 핀테크 앱을 만들 때 게임, 엔터테인먼트, 소셜 앱의 디자인 요소를 참고하여 혁신적인 "차별화 포인트"를 도출하는 데 도움을 줍니다.

### ⚙️ 유틸리티 도구
- **`/lazyweb-add-inspo-source`**: **외부 영감 라이브러리 연결**. 
  Mobbin, Savee 등 외부 디자인 라이브러리를 연결하여 레이지웹 리서치 프로세스에 포함할 수 있게 합니다.
- **`/lazyweb-remove-inspo-source`**: **라이브러리 연결 해제**. 
  연결된 외부 디자인 라이브러리를 워크스페이스에서 제거합니다.

## ⚙️ 설정 및 설치 방법

### 1. 무료 레이지웹 토큰 발급
터미널에서 아래 명령어를 실행하여 무료 Lazyweb MCP 토큰을 생성하고 저장하세요:

```bash
mkdir -p ~/.lazyweb
curl -k -sS -X POST https://www.lazyweb.com/api/mcp/install-token \
  -H "content-type: application/json" \
  -d '{}' | node -e 'let s="";process.stdin.on("data",d=>s+=d);process.stdin.on("end",()=>{
    try {
      const token = JSON.parse(s).token;
      require("fs").writeFileSync(require("os").homedir() + "/.lazyweb/lazyweb_mcp_token", token);
      console.log("✅ 토큰이 성공적으로 저장되었습니다: ~/.lazyweb/lazyweb_mcp_token");
    } catch(e) {
      console.error("❌ JSON 파싱 에러:", e.message);
      console.error("응답 내용:", s);
    }
  })'
```

### 2. 안티그래비티에 설치

#### 옵션 A: npm을 이용한 설치 (권장)
npm을 통해 설치 패키지를 다운로드하고 즉시 설치 스크립트를 실행할 수 있습니다:

```bash
# 전역 설치
npm install -g @giljae/ag-lazyweb-skill

# 설치 프로그램 실행
ag-lazyweb-install
```

#### 옵션 B: 수동 설치
리포지토리를 로컬에 클론한 경우, 제공된 스크립트를 직접 실행하세요:

```bash
./scripts/install.sh
```

이 스크립트는 스킬들을 `~/.gemini/antigravity/skills/` 경로로 복사하고, 전역 `mcp_config.json` 파일을 업데이트합니다.

### 3. 삭제 방법
설치된 스킬을 제거하고 MCP 설정을 원상복구하려면 다음을 실행하세요:

```bash
./scripts/uninstall.sh
```

## 📖 사용 예시

- `"/lazyweb-design-research 현대적인 AI 앱들의 온보딩 방식을 조사해줘"`
- `"/lazyweb-quick-references 다크 모드 대시보드 예시들을 보여줘"`
- `"/lazyweb-design-improve 이 결제 페이지를 어떻게 개선하면 좋을까?"`

---

### 크레딧
이 프로젝트는 aboul3ata의 [lazyweb-skill](https://github.com/aboul3ata/lazyweb-skill)을 기반으로 합니다. 안티그래비티 팀에 의해 안티그래비티 전용으로 포팅 및 최적화되었습니다.

## 라이선스
MIT
