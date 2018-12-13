@bench
Feature: Benchmark flash-message API

Background:
* url baseUrl

Scenario Outline: Performance testing

    Given path 'flash-message'
    When method GET
    Then status 200
    And match response == '#[]'
    * def length = response.length

    Given path 'flash-message'
    And request { active: <active>, content: "<content>" }
    When method POST
    Then status 201

    Given path 'flash-message'
    When method GET
    Then status 200
    And match response == '#[]'
    And assert response.length > length

    # generated with https://www.browserling.com/tools/text-from-regex

    Examples:
        | active | content      |
        | true   | Hello World  |
        | false  | Hello NUeaCCnJQn5fmCMdf62zy4Js4P7vjbt9qVbWRoAqD9eBC7jhgimuqH2XS3oxJixMkm8B0XTs ! |
        | false  | Hello JtPTzzrTPNKStQV1sJSFqSKsgpOmXuwk3SPRGD1LKNPxPK6f46GgyjwddzxTp06R8m_tashm2Q4Kh5 ! |
        | true   | Hello Zq1emj8uEJBmjjek2nqM ! |
        | false  | Hello PojXIs864JKea3qbbEhzU0bRVke0dcQd9KfBaPUbFxABpKdnCxlV5Y7O2Lu_pjOKnZEllWy ! |
        | false  | Hello cbHcYVUYMrV0BT7yPU839Zv_zyAMYKgajrs86zbOCesiINb_DRg8TXxeTs9LleIeLZ7KOR5zX0jq ! |
        | false  | Hello m2TKHB3Vjbko7NP9JaqDvqcGtKfPakg6XDZYcZ02OL87AzCYdmeRbXlnMlW01IPwS_DsArZRAVo ! |
        | true   | Hello v_FdbiaJeNzWfy1eY83lbwuC ! |
        | true   | Hello uqJ5y70gs9_2Fj_QndMXqrS1qv5QutYv8AiMPoOB9OEG_IW_6MPGKpicN1b1rr5IYKVM2L3rCIKjSAXKKm7fDiYtDxIb ! |
        | false  | Hello 55SPyc8mlZ_QouBlmU ! |
        | false  | Hello DgP9 ! |
        | false  | Hello _ZrlZlPfu8vnFXcmnNHSA6eynvEfJ_izwByrxJl9VHYL99QqQhuUa616MAIMAadcTDu740rwAe_yX6aTy24k0Qj7UBb9 ! |
        | false  | Hello GlXsNLstJWtRCPOHU5g8wnmr17wOU8LYDkaenIa4dyGoq5g1IQU2yvV9ouOx4fgrhoXYGnN8MnLHMmaKY ! |
        | false  | Hello v ! |
        | false  | Hello wwWXI7ozoM9AZJ80ggpu7QrKIG ! |
        | true   | Hello MuJ3uGQRLOSrwvYSyn4FNFxhqFUxZJVYHfh9ZZoDpDrqo0 ! |
        | true   | Hello nUy9HV36lXOyfMy1ZCkCz49igbWY1b6oSv2SN05gCa2aq55f96gWzTaoUz9ffqhclR5S8YqpwTTwpGnVhG7g ! |
        | false  | Hello ZJsqi8Jd_QNiUc3kHmzJ ! |
        | true   | Hello jnK68mExVWlB5BbwzY8_djApiX5HdL6fjVHw9mFkJhsQeIylxPhZr ! |
        | false  | Hello 8sw6BFn1RvzPJS1EReqhLGWUe42SzMcdXEY6CMr5xlxX9G8OUtTl_TJJl22mzEELcT3cIcqb ! |
        | true   | Hello X8z_MJIWGN4VfJelshEIX_kgIJyV8H_gbXwwQl0kXZeAm1xwD4u9GtBXuM7zlL2DKuiAPhFQRDGKQcL8BfWkg0O07UNrJ ! |
        | true   | Hello feHnKILNGr0g8SLlx1q_oBQz0rzwgYTTg_XHh8b9U5uaRFTMDDYaksNXmmhg0fX7iEzo93AdQ2jR ! |
        | false  | Hello 382ydGOSmsZzsTAUczVkbGkZgunmiOGqidNFHfygw8hzrCaZfFsIi5tXSzs_rob ! |
        | false  | Hello JsKHl05LOMsE7L6XroHanvTay2qub9cx7fsbXETYHAJ1b2tu8X0 ! |
        | false  | Hello 1_UIBcUdrNb4lRDCs60pta7TKR39JhnrHDrNZeaimrfqNHqLyB ! |
        | true   | Hello MGsKZ8QXGCBxYLqu624JpvMOdDIIunMBXab4ItDXyL1gzcVuWadj48d9aLJFawAKKsusY2gnP6BB5d7iohC4mOa ! |
        | true   | Hello RjKR9zArrmaUeNTwaijpzvC21HbPQ2kedsnx9Rq9dd9s ! |
        | true   | Hello m9KwxQedK45oM9VWPsFbNawJ_qL81cX1GPUBLxBzx45bjwxoZLQ8mW62BGH19mA ! |
        | true   | Hello _F7Mv0F ! |
        | true   | Hello BvfqJenrNbCEqtm9PWO2Lwt6_oT3br6xwtf4mV24IHNNW56yTzT6YEZYuFW4GJGm1PgmLbbQAy1auQKCdIVzYO_KJ ! |
        | false  | Hello WN6pfGIUpi4lmwjF0J5HwIOgPKVU8x4BIu7Q9bKDAXm5ZcgzFeaGod7xBTxxgdTcJZfQpLbKuFZQfMzx6CbMy9iCjXlkUQjwmhSP ! |
        | true   | Hello _6JMWgMoHEURcQfV5VbC_NkLy9qSWX8NUeHw1bRf ! |
        | true   | Hello 8o3MTtGDMsb8_Cjd9icQR54Ffj9i0fQlk_Z ! |
        | false  | Hello 7xMCji2s5wvP9zOO8F48gEXe29i3DADIjrSBKaywUTUhMsUQlNyYIyutTH6fzPX6rmccQfR76JEb3KO0uEzH2h ! |
        | false  | Hello gHya28PswNHpZ8SfiAuqa8fv86WRzPcmSWczUZcd2J3jhB9anSa1jBovfTBwzIniqxJkQvAXus0gK1mWSW ! |
        | false  | Hello 8qDmfedVnKAB ! |
        | false  | Hello fZtXtCzp8RGBFB5Pj8DRlIDGEJ4ZfZHg98EjelTtIZxGH72eZLGs5Im1Dd5uTuAdR984vkiYRhUqQo7ZdDuNRiUaj062u9daygBy ! |
        | false  | Hello UHLOznNb9NWUl_GAbYqOir4h6Bgglg3GN78NGSNoxiv4DfpJeJmrip9Ivn3OWVvyFxgS_2Q7lthYRpkzc ! |
        | false  | Hello EytdxXbcj2djyDYz1neMlPvg3cmOinw2k8TB ! |
        | true   | Hello ze8zh25fB33Q8b ! |
        | true   | Hello oCTaZQnnIZD8YyZIK92cQs9kuBPidpngSr0YPXLggPcJPX1h0BkMQDJJP6nFYxrhIibXM3SIG9hbwlmLfRZtupI0uFL1I ! |
        | true   | Hello r7gOQOPbyNvPgPdkLFZ3rD1D21iy9NbOGHIKYaeSK ! |
        | true   | Hello Tj9pjaW_GuWUAu8FXU0nk7RfgDztFcVsi0uew_8YE49OvHKpNqG ! |
        | false  | Hello tt3vvDUTJfXledVQL94mpajfmZuY02b9YyHvMh6q8o4SZZqZJB0lg ! |
        | false  | Hello D5xKcdXgPk15swPdUjhepzlGIWEZQ9VbB ! |
        | false  | Hello m6fmIZmf6PTm3e9Y0lZIQBQYLgVjH1D5eYL6kqCFHJA7gMiW ! |
        | true   | Hello sjhCJmiuuAkKUaR3fRbTtJLrkm6_f33d3DLO9Z7KjAU5XQdyIbz7GxruJfFf7qvzyoBz0l7AMvzN7ijvM7XcfL4S0yNzloaEb3G ! |
        | true   | Hello o2LYfXzuzhH8KgNrYEDxUczDXU7nUVMWSRilV ! |
        | true   | Hello 82qlEa2byO60zg9k79HRRiEN9StNDP4QLRFQfzzjVenqSX5zYogbsyQawv2A8DBPWcTyilFaEbheEOu5k ! |
        | true   | Hello 5jSLfW0Qm5uEaa4whRYUKO5xNuk5K4eZsPVLeFgFU ! |
        | false  | Hello FATimeJvGjW ! |
        | false  | Hello GNvVnj ! |
        | true   | Hello 6Nfbo_h2JbO76S94n7IO7ld1vvhtagkwYyqO7R98cRM_QVY1YTXcZ2EA_AXGi2pZD66 ! |
        | false  | Hello RR1aR7tKXuxrb_se_KL_V2xm8qE4l_uOv6urc6DrIu_zCSd9mYYjc4WFcrTBX8vekmX ! |
        | true   | Hello jjTOnEhRdrv_CKxdSM4PKf0tMPm3tShW ! |
        | true   | Hello DSDz6QuCSJPpJpZCbDiGo_EWs86S0DO4Xx7F3F5WJNo97EIAFCSCXnPhhiYB6WuW_y_hJiO0T ! |
        | false  | Hello iHl2fPeI ! |
        | true   | Hello wRo4uIphVFAAE_oZ_n1oyBAAlIVzc8 ! |
        | true   | Hello aIzOoYxwxSyg1S99QFuDKcRkGBrPhuFeJfmIlGwHJY98Gjg0D5u9fpBnq7ycwYGH ! |
        | false  | Hello ecEV5gkKPN2hNzcLwM0UQXf25zSmeAPWYREte3eijvqpkJPmV ! |
        | true   | Hello aRmkp_Oriifw_NKYKKxkSyvsN3UxLwerkOQJB3QLOl8OA2lKyDsdItS9Gosn5BRyI_cbcE1f_gr7WpM3NawFGWxuxF ! |
        | false  | Hello r9glk18ovX88JdFDqdUBsNvIFo0_v ! |
        | false  | Hello FfSr1Qdlz7fajDvDkpjDZPa6wyJGKImR5ZdxRQDPdKO9t3F4tdo2JE4SoI9 ! |
        | false  | Hello f2RG8DO8X4hj0PVIvqSwS4XzV ! |
        | false  | Hello lKdVJ62hKLsRryw__dHJEiL2OEwUK6dbcZ7PHRn18TDphxaXOFcreqAB_mlthRkZIilpY6hFvEOO7WICKC15ZevxIqCJ ! |
        | false  | Hello vLJyO2Dtu ! |
        | false  | Hello DQYCj4zq8vbY8vqiMKB224AA6B3DzJwGuVVo_zWJhaDB8Tr_pxY7v0nw7fJheTPO4XNfJ_F32FkSSBFr6S8VGV5fRz5kcSGDB ! |
        | true   | Hello WdzyxztiZwe1QlXNVwY9CQ5zSlvu21JBsuS9OUtuCPBA9uRdECXmLD5OT3mdRoMVe8u9l0Wbh3cRadv0xl ! |
        | false  | Hello TuiFw9Um7AHA7PuTJuyy12aJs81cHetVa7sR4Mdw8Oj0Kv7Qmrq0GCECf ! |
        | true   | Hello YZ11OITg8sVN ! |
        | true   | Hello GK5NOfqqE5eE91W8bC3yYECwHTNo ! |
        | true   | Hello WnB6x4k ! |
        | false  | Hello xEkEMH ! |
        | true   | Hello vJ1MfTkOR3HuZDX57a9rfoA9qzCw6lcoKm1e4cwT1r6fYmukCHT0GaOjcldUZE4o3iGI5vq ! |
        | true   | Bye BT9hkEaq6qKlImmoEAScqb |
        | true   | Bye MkzZE1ydBDd_oBTi |
        | false  | Bye MpTZalxAHB6pgMthrg3_C41jmBzXPqVFao_UOlo9byEq |
        | true   | Bye kXSVbhS4GO5cEF8rip_AiLk4nnk7r_pXNQsvbSaGZRpH0ZDBSZNKhvez5AEojcmfDSzgQ2PEYjvJsP4m76WDdF1UDtjP |
        | true   | Bye VHOZgYXXeo4XmpY6pDn |
        | false  | Bye mk67ciRCE3Er2OLn8azBoz2i51B6jv31G1vM4stetBEi0IQyRNcBfcRmr3IdeBup |
        | true   | Bye YTC4gxZ_59wIHXPOfleHXskRbx3p_socFqI5xs36JfSWBECiUhovMnPElZKy3J0X0C4udUPv_JMD |
        | false  | Bye c94Pes8P4AXL2x |
        | true   | Bye Px5tFizSUUSNulG5FxRvIzT0cNjAbQp4 |
        | true   | Bye DAJOYH37f65dMosp72cbS5G3E61JDCMNzROsYGmtLmC3doTGcWfNTGtrEgaPAV7MASMDKEmPcHpdBFBQ |
        | true   | Bye YYNp9YWa8BbHyHh4a7zkVx3KQqXmIWwoGU3 |
        | false  | Bye 1Hj |
        | true   | Bye XitjrJ1R4eWwd8t_HZb |
        | true   | Bye XSNCy9mt8f7Pps_FsHjQsJpiDnE7590uiqKewCUiTRdJCfgudc5uDKk7cZ71UwqQ |
        | true   | Bye xptFRfhY4KoqidiZW93A9GeMWTCcQLUURGYCp6KPeJbX43LM |
        | false  | Bye arx3l2_X1WtR766hepDd7jsQhr4_e9oKUTBYsALoZ7zIPz2E_kQE9cCV8vx6DbBabAfSiEQ |
        | true   | Bye AgC8A2hNIENlFosdcb4lhI8htxTbXiJmx9k0jBd5g0ukPrkpNn39zYY413h5Y0x |
        | true   | Bye 9FwMvqOfDFuMfaUn7kIeDzhP6kkS_FPVC5KuEb3qX |
        | true   | Bye htV4nHLP8gRbzAv0H_cZN95Yk_15PWefIphytI2DA |
        | true   | Bye UL |
        | true   | Bye m6P6Lyz6q9v_0skR0D4oIP0sQNrjRMfw_g8tquTFn4uQMeTesBUxHenU9VPg5fXs |
        | false  | Bye wmgqajonw |
        | false  | Bye zwnij9pvZlEbjI2bs1SQjzMqXXKCM16QpxU0nm0UzEUu1PpVky8oUkOlTgVjyc |
        | true   | Bye H78PjuDiA2YVhLvS2E3_wXj1yLtiLe8uZwc8GZjJgapw0HjP_IKYfSIvG5b5Fhf6AzjBOtcAZtb2amSwun6ARLv2VUO |
        | true   | Bye uIfL1RQeAZNEUZGi |
        | true   | Bye gIH7abKyl9HuN8dJ2yFMFdnrLwDk9jhZcRgMaw9YdXxRo9M7stP0_taFEd0gh |
        | true   | Bye pJnbyoCxaMbixdLI4dogZBcdsQ1FIKUFXHXCtFZ_YXT2qVjEi8AZc69WA1umEAzuSgdQLd3hBK2FF6dqUCsQuXeXrcryR |
        | false  | Bye YXJZWgHJRXMmEtZh237dcnD6YJHmMIKyfJ7oLL3xQ6zr5Xwdv0CtUZfOFB_TexT6 |
        | true   | Bye DRhDYimmyv4h_ZjEJBSZ9lbyrJaf1JmYA7QvgvQGdvDCIvfIzCMehdXz2hE |
        | true   | Bye ycEYTJz30Lc10ReasHsW1FLBJnuDt31C2kMpjo |
        | false  | Bye NYbrzPdEk0U05dWBP3D6EIH8hO0qLSjbC5no7QkZmJL2bV2kJofAoTRh5MeJyVETB2gIyiq9AbXg0cuMj9Ala |
        | false  | Bye SN3tgx2ImBTXhX8yg3xq |
        | true   | Bye vQC_r9fICGlPmDEa3VkRHDTtBRYX3tl2rMinOBL0iAuaqoCiBj7VznIPwN83zcIKA |
        | true   | Bye LhTX8UZOKYtuBLqzABQgnwAqjqkB |
        | false  | Bye pF3lxW5k68hJ |
