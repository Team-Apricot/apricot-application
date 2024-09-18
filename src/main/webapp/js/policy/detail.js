document.addEventListener('DOMContentLoaded', function() {
    const toc = document.getElementById('toc');
    const policyTitles = document.querySelectorAll('.policy-title');
    const policyTableContents = document.querySelectorAll('.policy-table-content');
    const listTitles = document.querySelectorAll('.list-title'); // list-title 선택
    const listContents = document.querySelectorAll('.list-content'); // list-content 선택 // list-container 내 항목 선택
    // 목차 제목 생성
    const tocTitle = document.createElement('h3');
    tocTitle.textContent = '목차';
    toc.appendChild(tocTitle);

    // 목차 목록 생성
    const tocList = document.createElement('ul');

    // policy-title와 policy-table-content를 순회하면서 목차 항목 추가
    policyTitles.forEach((section, index) => {
        const sectionTitle = section.querySelector('h2').textContent; // 섹션의 제목
        const sectionId = `section${index + 1}`;
        section.setAttribute('id', sectionId); // 섹션에 ID 추가

        // 목차 항목 생성
        const listItem = document.createElement('li');
        const anchor = document.createElement('a');
        anchor.href = `#${sectionId}`;
        anchor.textContent = sectionTitle;

        // 부드러운 스크롤 기능
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const targetElement = document.querySelector(this.getAttribute('href'));
            window.scrollTo({
                top: targetElement.offsetTop,
                behavior: 'smooth'
            });
        });

        listItem.appendChild(anchor);
        tocList.appendChild(listItem);
    });

    // policy-table-content에 대해서도 처리
    policyTableContents.forEach((section, index) => {
        const subSectionTitle = section.querySelector('h3').textContent; // 세부 항목 제목
        const subSectionId = `subsection${index + 1}`;
        section.setAttribute('id', subSectionId); // ID 추가

        // 목차 항목 생성
        const listItem = document.createElement('li');
        const anchor = document.createElement('a');
        anchor.href = `#${subSectionId}`;
        anchor.textContent = subSectionTitle;

        // 부드러운 스크롤 기능
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const targetElement = document.querySelector(this.getAttribute('href'));
            window.scrollTo({
                top: targetElement.offsetTop,
                behavior: 'smooth'
            });
        });

        listItem.appendChild(anchor);
        tocList.appendChild(listItem);
    });

    toc.appendChild(tocList);

    // Intersection Observer로 등장 애니메이션 적용
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
            }
            else{
                entry.target.classList.remove('visible');
            }
        });
    }, {
        threshold: 0.1 // 요소가 10% 보이면 동작
    });

    // 각 policy-title과 policy-table-content 요소에 관찰자 추가
    [...policyTitles, ...policyTableContents].forEach(section => {
        observer.observe(section);
    });

    // list-title과 list-content 각각에 대해 페이드인 효과 적용
    const listObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('fade-in'); // 페이드인 효과 추가
            }
        });
    }, {
        threshold: 0.1 // 10%만 보여도 애니메이션 시작
    });

    // list-title과 list-content 각각에 대해 감시 적용
    [...listTitles, ...listContents].forEach(item => {
        listObserver.observe(item); // 각각의 list-title 및 list-content에 대해 감시
    });
});
